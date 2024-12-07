docker build -t mysql-image .
docker run --name mysql-cont -p 3306:3306 mysql-image