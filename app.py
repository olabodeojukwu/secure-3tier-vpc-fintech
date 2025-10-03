# ~/fintech/app.py
import os
from flask import Flask, request, jsonify
import pymysql

# Database credentials from .env
DB_HOST = os.environ.get("DB_HOST", "127.0.0.1")
DB_USER = os.environ.get("DB_USER", "fintech_app")
DB_PASS = os.environ.get("DB_PASS", "ChangeMe123!")
DB_NAME = os.environ.get("DB_NAME", "fintech_db")

app = Flask(__name__)

def get_conn():
    return pymysql.connect(host=DB_HOST, user=DB_USER, password=DB_PASS, db=DB_NAME,
                           cursorclass=pymysql.cursors.DictCursor, connect_timeout=5)

@app.route("/")
def index():
    return "Fintech App: OK"

@app.route("/pay", methods=["POST"])
def pay():
    data = request.get_json() or request.form
    amount = data.get("amount")
    if not amount:
        return jsonify({"error": "amount missing"}), 400

    conn = get_conn()
    try:
        with conn.cursor() as cur:
            cur.execute("INSERT INTO payments (amount, metadata) VALUES (%s, %s)",
                        (amount, str(data)))
            conn.commit()
            return jsonify({"status": "ok", "amount": amount}), 201
    finally:
        conn.close()

@app.route("/payments", methods=["GET"])
def payments():
    conn = get_conn()
    try:
        with conn.cursor() as cur:
            cur.execute("SELECT id, amount, metadata, created_at FROM payments ORDER BY created_at DESC LIMIT 50")
            rows = cur.fetchall()
            return jsonify(rows)
    finally:
        conn.close()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
