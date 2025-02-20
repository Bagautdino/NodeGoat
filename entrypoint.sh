#!/bin/sh
echo "Ожидание запуска MongoDB..."

until nc -z -w 2 mongo 27017; do
  echo "MongoDB ещё не готов, ждем 2 секунды..."
  sleep 2
done

echo "MongoDB готов к подключениям!"

node artifacts/db-reset.js

exec npm start
