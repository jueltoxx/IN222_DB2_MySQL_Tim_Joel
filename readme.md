# Informationen
Dieses Repository beinhaltet alle Daten um die ursprüngliche Oracle HFTM Vereinsfatenbank in einer MySQL-DB aufzubauen.
Dazu wird ein Container erstellt welcher MySQL ausführt, die nötigen .SQL Files implementiert und am Ende die Datenbank mit User und Daten zur Verfügung stellt.

## Unterschiede zur Oracle DB
** Anspruch / Optimierung **
MySQL ist super für kleine einfache Datenbanken
Oracle hat mehr SIcherheitsfeatures und optimiert für "Large-Scale" Applikationen
Oracle ist sehr teuer (Business Einsatz) vs. MySQL OpenSource

** Einfacher Umgang mit Datumswerten **
Bei Oracle müssen Zeit und Datumsangaben immer in solche umgewandelt werden (TO_DATE) um damit zu arbeiten.
Bei MySQL ist dies weder bei der Dateneingabe noch beim Abruf notwendig.

** Datentypen **
Oracle: VARCHAR2, INTEGER, NUMBER und DATE
MySQL: VARCHAR, DECIMAL, CHAR und INTEGER

** Präfixe **
Oracle spricht tabellen über Schemas an z.B. vereinuser.Personen.
MySQL benötigt dies nicht.

** DB Beziehungen **
Private und Foreign Keys werden in den .SQL Files anders definiert.


**Image Bauen**
Befehl in Directory ausführen wo dockerfile und init.sql liegen
```console
docker build -t mysql-image .
```
-> Image auf Github Docker Registry
```console
docker build -t ghcr.io/jueltoxx/mysql-image:latest .
docker push ghcr.io/jueltoxx/mysql-image:latest
```

**Container erstellen auf Basis des Image**
*lokal*
```console
docker run --name mysql-cont -p 3306:3306 mysql-image
```

*ghcr.io image*
```console
docker run --name mysql-cont -p 3306:3306 ghcr.io/jueltoxx/mysql-image:latest
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
docker stop mysql-cont

3. Physisches Verzeichnis des Container finden (sofern nicht schon bekannt)
docker inspect mysql-cont | grep "Destination" 

4. Mittels docker Copy Datenbankfiles auf Host kopieren
docker cp mysql-cont:/var/lib/mysql/mydatabase ./backup/

5. Die gespeicherten Daten können auf jeder MySQL Datenbank, welche die selbe Version hat wie die ursprüngliche DB, eingelesen werden.

**Erwartete Ergebnisse**

Ein Docker-Image auf der GitHub-Container-Registry, das auf einem beliebigen Rechner gestartet werden kann und die Vereins-Datenbank bereitstellt.

-> Unser Image kann auf jeder Plattform und Architektur ausgeführt werden wo docker installiert ist.

---
Das Image sollte einen SQL-Client enthalten über den man sich über die Kommando-Zeile im Container auf die Datenbank verbinden kann.

-> das default MySQL Image enthält bereits einen MySQL Cient. Verwendung:

```console
docker exec -it mysql-cont mysql -u root -p
```