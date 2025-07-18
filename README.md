


# 🛍️ Medusa Backend (Dockerized)

This is a **Dockerized Medusa backend** with PostgreSQL.  
It allows you to quickly spin up a Medusa server for local development.

---

## 📌 Features
✅ Medusa v2 backend  
✅ PostgreSQL database  
✅ Docker + Docker Compose setup  
✅ Automatic migrations on startup  

---

## 📂 Project Structure


.

├── Dockerfile # Multi-stage Docker build           
├── docker-compose.yml # Services: medusa-backend & postgres      
├── docker-entrypoint.sh # Waits for DB, runs migrations, starts server  
├── medusa-config.ts # Medusa config (DB, CORS, secrets)      
├── src/  # Application source code                
├── package.json # Dependencies & scripts       
└── README.md              



---

## 🚀 Getting Started

### 1️⃣ Clone the repository
```bash
git clone https://github.com/chennurisaiteja/medusa_app_Dockerrepo.git
cd medusa_app_Dockerrepo

2️⃣ Start the containers

docker compose up --build
Medusa API → http://localhost:9000

Admin Dashboard → http://localhost:9000/app

👤 Create an Admin User

Open a shell inside the running container:
docker exec -it medusa-backend bash

Run the user creation command:
npx medusa user -e admin@example.com -p supersecret

✅ Replace with your own email and password.


🔧 Configuration
Environment variables are stored in .env:


PORT=9000
NODE_ENV=development
JWT_SECRET=supersecret
COOKIE_SECRET=supersecret
ADMIN_CORS=http://localhost:7000,http://localhost:7001
STORE_CORS=http://localhost:8000
DATABASE_URL=postgres://postgres:postgres@postgres:5432/medusa-my-medusa-store
PGSSLMODE=disable

✏️ Tip: If you change DB credentials in docker-compose.yml, update them here too.

🛠️ Useful Commands
Restart containers

docker compose down
docker compose up --build


Clean everything (including DB data)
⚠️ This deletes your Postgres data:

 docker compose down -v
