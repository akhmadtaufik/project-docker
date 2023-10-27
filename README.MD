1. Pastikan container postgres ketika dijalankan udah ada database dan tabel :
CREATE TABLE kanban(
    kanban_id SERIAL PRIMARY KEY,
    public_id VARCHAR(50),
    title VARCHAR(50),
    content VARCHAR(255),
    is_done BOOLEAN DEFAULT FALSE
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    public_id VARCHAR(50),
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(50)
);

2. Koneksi ke container postgres setup di file .flaskenv

3. Running flask (python3 -m flask run --host=0.0.0.0)