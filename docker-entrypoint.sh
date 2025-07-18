#!/bin/bash
set -e
set -o pipefail

echo "⏳ Waiting for PostgreSQL at $DATABASE_URL ..."
until pg_isready -h postgres -p 5432 -U postgres > /dev/null 2>&1; do
  echo "Waiting for postgres..."
  sleep 2
done
echo "✅ PostgreSQL is ready!"

echo "🚀 Running migrations..."
npx medusa telemetry --disable || true
npx medusa db:migrate || {
  echo "❌ Migration failed."
  exit 1
}

echo "✅ Starting Medusa on port 9000..."
exec npx medusa develop

