import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["Имя", "Жим", "Присед", "Тяга"]

def generate_row():

    return {
        "Имя": random.choice(["Никита", "Виктор", "Кирилл"]),
        "Жим": random.randint(60, 120),
        "Присед": random.randint(60, 100),
        "Тяга": random.randint(80, 150),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)
