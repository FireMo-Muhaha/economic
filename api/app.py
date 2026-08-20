import os
import pymysql
import traceback
from datetime import datetime, date
from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

DB_HOST     = os.environ.get("DB_HOST", "mysql")
DB_PORT     = int(os.environ.get("DB_PORT", 3306))
DB_NAME     = os.environ.get("DB_NAME", "kh_department")
DB_USER     = os.environ.get("DB_USER", "kh_user")
DB_PASSWORD = os.environ.get("DB_PASSWORD", "")


def get_connection():
    return pymysql.connect(
        host=DB_HOST,
        port=DB_PORT,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
        cursorclass=pymysql.cursors.DictCursor,
        charset="utf8mb4",
    )


def serialize_row(row):
    """Convert datetime/date objects to string for JSON serialization."""
    if not row:
        return row
    clean = {}
    for k, v in row.items():
        if isinstance(v, (datetime, date)):
            clean[k] = v.isoformat()
        else:
            clean[k] = v
    return clean


@app.route("/health", methods=["GET"])
@app.route("/api/health", methods=["GET"])
def health():
    return jsonify({"status": "ok", "service": "kh-api"})


@app.route("/api/db-check", methods=["GET"])
def db_check():
    try:
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute("SELECT DATABASE() AS db")
            row = cur.fetchone()
        conn.close()
        return jsonify({"status": "connected", "database": row["db"]})
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500


@app.route("/api/tracks", methods=["GET"])
def get_tracks():
    try:
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute("SELECT * FROM tracks ORDER BY id ASC")
            rows = cur.fetchall()
        conn.close()
        clean_rows = [serialize_row(r) for r in rows]
        return jsonify({"status": "success", "data": clean_rows})
    except Exception as e:
        traceback.print_exc()
        return jsonify({"status": "error", "message": str(e)}), 500


@app.route("/api/activities", methods=["GET"])
def get_activities():
    try:
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute("SELECT * FROM activities ORDER BY id ASC")
            rows = cur.fetchall()
        conn.close()
        clean_rows = [serialize_row(r) for r in rows]
        return jsonify({"status": "success", "data": clean_rows})
    except Exception as e:
        traceback.print_exc()
        return jsonify({"status": "error", "message": str(e)}), 500


@app.route("/api/stats", methods=["GET"])
def get_stats():
    try:
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute("SELECT * FROM department_stats ORDER BY id ASC")
            rows = cur.fetchall()
        conn.close()
        clean_rows = [serialize_row(r) for r in rows]
        return jsonify({"status": "success", "data": clean_rows})
    except Exception as e:
        traceback.print_exc()
        return jsonify({"status": "error", "message": str(e)}), 500


@app.route("/api/news", methods=["GET"])
def get_news():
    try:
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute(
                "SELECT * FROM news ORDER BY pin DESC, created_at DESC"
            )
            rows = cur.fetchall()
        conn.close()
        clean_rows = [serialize_row(r) for r in rows]
        return jsonify({"status": "success", "data": clean_rows})
    except Exception as e:
        traceback.print_exc()
        return jsonify({"status": "error", "message": str(e)}), 500


@app.route("/api/news", methods=["POST"])
def create_news():
    try:
        data = request.get_json() or {}
        title = data.get("title")
        body = data.get("body", "")
        category = data.get("category", "ทั่วไป")
        pin = 1 if data.get("pin") else 0

        if not title:
            return jsonify({"status": "error", "message": "title is required"}), 400

        conn = get_connection()
        with conn.cursor() as cur:
            sql = "INSERT INTO news (title, body, category, pin) VALUES (%s, %s, %s, %s)"
            cur.execute(sql, (title, body, category, pin))
            conn.commit()
            news_id = cur.lastrowid
        conn.close()
        return jsonify({"status": "success", "message": "News created", "id": news_id}), 201
    except Exception as e:
        traceback.print_exc()
        return jsonify({"status": "error", "message": str(e)}), 500


@app.route("/api/news/<int:news_id>", methods=["PUT"])
def update_news(news_id):
    try:
        data = request.get_json() or {}
        title = data.get("title")
        body = data.get("body", "")
        category = data.get("category", "ทั่วไป")
        pin = 1 if data.get("pin") else 0

        if not title:
            return jsonify({"status": "error", "message": "title is required"}), 400

        conn = get_connection()
        with conn.cursor() as cur:
            sql = "UPDATE news SET title=%s, body=%s, category=%s, pin=%s WHERE id=%s"
            cur.execute(sql, (title, body, category, pin, news_id))
            conn.commit()
        conn.close()
        return jsonify({"status": "success", "message": "News updated"})
    except Exception as e:
        traceback.print_exc()
        return jsonify({"status": "error", "message": str(e)}), 500


@app.route("/api/news/<int:news_id>", methods=["DELETE"])
def delete_news(news_id):
    try:
        conn = get_connection()
        with conn.cursor() as cur:
            sql = "DELETE FROM news WHERE id=%s"
            cur.execute(sql, (news_id,))
            conn.commit()
        conn.close()
        return jsonify({"status": "success", "message": "News deleted"})
    except Exception as e:
        traceback.print_exc()
        return jsonify({"status": "error", "message": str(e)}), 500



@app.route("/api/applications", methods=["POST"])
def create_application():
    try:
        data = request.get_json() or {}
        full_name = data.get("full_name")
        email     = data.get("email")
        phone     = data.get("phone", "")
        track_id  = data.get("track_id")

        if not full_name or not email:
            return jsonify({"status": "error", "message": "full_name and email are required"}), 400

        conn = get_connection()
        with conn.cursor() as cur:
            sql = "INSERT INTO student_applications (full_name, email, phone, track_id) VALUES (%s, %s, %s, %s)"
            cur.execute(sql, (full_name, email, phone, track_id))
            conn.commit()
            app_id = cur.lastrowid
        conn.close()

        return jsonify({"status": "success", "message": "Application submitted successfully", "id": app_id}), 201
    except Exception as e:
        traceback.print_exc()
        return jsonify({"status": "error", "message": str(e)}), 500


def init_site_content_table():
    try:
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute("""
                CREATE TABLE IF NOT EXISTS site_content (
                    id INT PRIMARY KEY DEFAULT 1,
                    content_json LONGTEXT NOT NULL,
                    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
            """)
            conn.commit()
        conn.close()
    except Exception as e:
        print(f"init_site_content_table error: {e}")


@app.route("/api/site-content", methods=["GET"])
def get_site_content():
    try:
        init_site_content_table()
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute("SELECT content_json FROM site_content WHERE id=1")
            row = cur.fetchone()
        conn.close()
        if row and row.get("content_json"):
            import json
            data = json.loads(row["content_json"])
            return jsonify({"status": "success", "data": data})
        return jsonify({"status": "success", "data": {}})
    except Exception as e:
        traceback.print_exc()
        return jsonify({"status": "error", "message": str(e)}), 500


@app.route("/api/site-content", methods=["POST", "PUT"])
def save_site_content():
    try:
        init_site_content_table()
        data = request.get_json() or {}
        import json
        json_str = json.dumps(data, ensure_ascii=False)
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute("""
                INSERT INTO site_content (id, content_json) 
                VALUES (1, %s) 
                ON DUPLICATE KEY UPDATE content_json=%s
            """, (json_str, json_str))
            conn.commit()
        conn.close()
        return jsonify({"status": "success", "message": "Content saved successfully", "data": data})
    except Exception as e:
        traceback.print_exc()
        return jsonify({"status": "error", "message": str(e)}), 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
