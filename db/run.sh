mysql $DB_HOST -u${DB_USER} -p${DB_PASS} <schema.sql
mysql $DB_HOST -u${DB_USER} -p${DB_PASS} <app-user.sql
mysql $DB_HOST -u${DB_USER} -p${DB_PASS} <master-data.sql

