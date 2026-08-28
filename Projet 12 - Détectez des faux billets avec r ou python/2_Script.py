# ======================================
# DPI AWARE (WINDOWS 4K FIX)
# ======================================

import ctypes
ctypes.windll.shcore.SetProcessDpiAwareness(1)

import tkinter as tk
from tkinter import filedialog, messagebox, ttk
import pandas as pd
import joblib
import os

# ======================
# CONFIG
# ======================
MODEL_PATH = "script_input/best_model_pipeline.pkl"
OUTPUT_FOLDER = "script_output"


# ======================
# APP
# ======================
class App(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title("Détection de billets")
        self.geometry("900x700")

        # Chargement modèle
        self.model = joblib.load(MODEL_PATH)
        self.features = self.model.named_steps['standardscaler'].feature_names_in_

        self.file_path = None
        self.df_result = None

        # ================= UI =================
        top_frame = tk.Frame(self)
        top_frame.pack(pady=10)

        tk.Button(top_frame, text="📁 Choisir CSV", command=self.load_file).pack(side=tk.LEFT, padx=5)
        tk.Button(top_frame, text="▶ Lancer prédiction", command=self.run_prediction_save_result).pack(side=tk.LEFT, padx=5)

        self.label_file = tk.Label(self, text="Aucun fichier sélectionné")
        self.label_file.pack()

        # ================= TABLE =================
        self.tree = ttk.Treeview(self)
        self.tree.pack(expand=True, fill="both", pady=10)

        scrollbar = ttk.Scrollbar(self, orient="vertical", command=self.tree.yview)
        self.tree.configure(yscrollcommand=scrollbar.set)
        scrollbar.pack(side="right", fill="y")

        # ================= STATS FRAME (NOUVEAU) =================
        self.stats_frame = tk.Frame(self)
        self.stats_frame.pack(pady=10)

        self.stats_label = tk.Label(self.stats_frame, text="")
        self.stats_label.pack()

        # Canvas pour pie chart
        self.chart_canvas = None

    # ======================
    # LOAD FILE
    # ======================
    def load_file(self):
        path = filedialog.askopenfilename(filetypes=[("CSV files", "*.csv")])

        if path:
            self.file_path = path
            self.label_file.config(text=os.path.basename(path))

    # ======================
    # PREDICTION + SAVE
    # ======================
    def run_prediction_save_result(self):
        if not self.file_path:
            messagebox.showerror("Erreur", "Veuillez sélectionner un fichier CSV")
            return

        try:
            df = pd.read_csv(self.file_path, sep=None, engine="python")

            stockage_id = df["id"]
            df_clean = df[self.features].copy()

            preds = self.model.predict(df_clean)

            df_clean["prediction"] = preds
            df_clean["resultat"] = df_clean["prediction"].map({
                True: "Vrai billet",
                False: "Faux billet"
            })

            df_clean["id"] = stockage_id

            self.df_result = df_clean

            # TABLE (sans colonne brute prediction si tu veux)
            self.display_table(df_clean.drop(columns=["prediction"]))

            # STATS + GRAPHIQUE
            self.display_stats(df_clean)

        except Exception as e:
            messagebox.showerror("Erreur", str(e))
            return

        if self.df_result is None:
            messagebox.showerror("Erreur", "Aucun résultat à sauvegarder")
            return

        os.makedirs(OUTPUT_FOLDER, exist_ok=True)

        output_path = os.path.join(OUTPUT_FOLDER, "resultats_predictions.csv")
        self.df_result.to_csv(output_path, index=False)

        messagebox.showinfo("Terminé", f"Résultats sauvegardés sous :\n{output_path}")

    # ======================
    # DISPLAY TABLE
    # ======================
    def display_table(self, df):
        self.tree.delete(*self.tree.get_children())

        self.tree["columns"] = list(df.columns)
        self.tree["show"] = "headings"

        for col in df.columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=120)

        for _, row in df.iterrows():
            self.tree.insert("", "end", values=list(row))

    # ======================
    # STATS + PIE CHART
    # ======================
    def display_stats(self, df):
        # comptage
        counts = df["prediction"].value_counts()

        vrai = counts.get(True, 0)
        faux = counts.get(False, 0)
        total = vrai + faux

        pct_vrai = (vrai / total * 100) if total else 0
        pct_faux = (faux / total * 100) if total else 0

        # label texte
        self.stats_label.config(
            text=f"Vrais billets: {vrai} ({pct_vrai:.1f}%) | Faux billets: {faux} ({pct_faux:.1f}%)"
        )

# ======================
# RUN APP
# ======================
if __name__ == "__main__":
    App().mainloop()