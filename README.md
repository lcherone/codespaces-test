# Codespaces

A workspace for a NodeJS Express app which needs a MySQL database with Adminer to manage it.

Installs MariaDB, PHP.7.4, Adminer and NodeJS 16.7.0

Express app is an example.

### Setup

Once installed into a codespace, run `npm start`.
To manage the database with Adminer, view the ports tab in the editor then open the local address link for Apache2 (Adminer)(8000) in your browser.


#### Todo

 - Import an exported .sql file on boot, which would contain demo data.
 - Improve the express example to query from the database.
