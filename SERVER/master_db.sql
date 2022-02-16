CREATE SERVER master_db FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host '127.0.0.1', dbname 'mobile-walker-portal', port '5432');

ALTER SERVER master_db OWNER TO postgres;
