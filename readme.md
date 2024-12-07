**Image Bauen**
Befehl in Directory ausführen wo dockerfile und init.sql liegen
```console
docker build -t mysql-image .
```

**Container erstellen auf Basis des Image**
```console
docker run --name mysql-cont -p 3306:3306 mysql-image
```

**Container starten (sofern nötig)**
```console
docker start mysql-cont
```

**Zugriff auf DB**
Wenn der CLient einen MySQL Client installiert hat:
```console
mysql -h 127.0.0.1 -P 3306 -u root -p
```
Wenn kein Client installiert ist, kann der MySQL client welcher auf dem Container integriert ist verwendet werden.

```console
docker exec -it mysql-cont mysql -u root -p
```

**Speichern der Daten**
# Variante 1 - verwenden eines MySQL Dump
```console
docker exec -i mysql-cont mysqldump -u root -p mydatabase > mydatabase_dump.sql
```
Exportiert ein .sql File welches die gesamte DB inklusive der Daten wieder erstellt. Das Dumpfile wird automatisch direkt auf dem Host angelegt

# Variante 2 - verwenden physischer export

1. Datenbank auf dem Container stoppen
docker exec -it mysql-cont mysqladmin -u root -p shutdown

2. Container stoppen
docker stop mysql-container

3. Physisches Verzeichnis des Container finden (sofern nicht schon bekannt)
docker inspect mysql-cont | grep "Destination" 

4. Mittels docker Copy Datenbankfiles auf Host kopieren
docker cp mysql-cont:/var/lib/mysql/mydatabase ./backup/

5. Die gespeicherten Daten können auf jeder MySQL Datenbank, welche die selbe Version hat wie die ursprüngliche DB, eingelesen werden.

**Erwartete Ergebnisse**

Ein Docker-Image auf der GitHub-Container-Registry, das auf einem beliebigen Rechner gestartet werden kann und die Vereins-Datenbank bereitstellt.

-> Unser Image kann auf jeder Plattform und Architektur ausgeführt werden wo docker installiert ist.
-> VEREINSDB NOCH NICHT VORHANDEN

---
Das Image sollte einen SQL-Client enthalten über den man sich über die Kommando-Zeile im Container auf die Datenbank verbinden kann.

-> das default MySQL Image enthält bereits einen MySQL Cient. Verwendung:

```console
docker exec -it mysql-cont mysql -u root -p
```