TurboG Mikrotik Logger 
M.Ali VARDAR - www.turbog.com


Application Installation Steps
------------------------------

- Install MySQL server
- Create a MySQL user
- Import \MySQL_Database\latest.sql file to MySQL
- Give to MySQL user permission for database 'turbogmikrotikloggerservice' 
  you can change database name in latest.sql file
- Edit config ini file with your MySQL settings
- Start 'TurboG Mikrotik Logger Service' from services.
- You can connect to  http://127.0.0.1:8077 on an internet browser.




Application Remove Steps
------------------------

- Stop server from services.
- Uninstall from 'Programs and Features' (Name can be different on your windows)
- Remove user from MySQL server
- Drop database from MySQL server


