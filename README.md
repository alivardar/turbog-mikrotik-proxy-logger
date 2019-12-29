TurboG Mikrotik Logger 
---------------------------------------------------------------
M.Ali VARDAR - www.md5m.com

It is a fully web based application for store Mikrotik Web logs to MySQL database server.  
We tested on Windows 7 and Windows 8 systems.

Working on win32.
MySQL database
Working as a  windows service.
Embedded web server. (You don’t need any web server installation)
Don’t need any extra language. (php, asp..)
Easy management on web browser.

Installation
-----------------------------
Unzip file  to any working place.  You can run service_install.bat file with Administrator privileges. 
Normally setup will create this service. You will see like that a line in windows services window;

Prepare MySQL for store, you have to use latest.sql file for creating database and files. 
Then you have to change config.ini file for MySQL access. Please be sure MySQL configuration 
and installation fine.  Theme options are classic, blue, XP, Vista, Gray and Access. 
You can define in config.ini file. You have to restart service. Please don’t forget 
prepare your mikrotik devices logs route to your server.  Mikrotik device web logs configuration
must be looks like that screen. If you have any connection problem with database please check
debuglog.txt file in application installation directory.

Download
----------------------------
You can download full version.
Latest version is 2.2
SQLite edition also support self install. Just install and open your web browser 127.0.0.1:8077 that’s all.
Default username admin and password is 1
Don’t forget prepare your mikrotik devices. You can learn more details from screen shots. All mikrotik configurations must be same with in application screen shots.

![Alt text](http://www.md5m.com/wp-content/uploads/2012/05/service.png "title")

Application Installation Steps
------------------------------
- Install MySQL server

- Create a MySQL user

- Import \MySQL_Database\latest.sql file to MySQL

- Give to MySQL user permission for database 'turbogmikrotikloggerservice' you can change database name in latest.sql file

- Edit config ini file with your MySQL settings

- Start 'TurboG Mikrotik Logger Service' from services.

- You can connect to  http://127.0.0.1:8077 on an internet browser.

Application Remove Steps
------------------------
- Stop server from services.

- Uninstall from 'Programs and Features' (Name can be different on your windows)

- Remove user from MySQL server

- Drop database from MySQL server

![Alt text](http://www.md5m.com/wp-content/uploads/2012/05/mainscreen.png "title")
