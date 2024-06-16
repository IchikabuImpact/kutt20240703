DO
$$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'postgres') THEN
        CREATE USER postgres WITH PASSWORD '331155';
        ALTER USER postgres WITH SUPERUSER;
    END IF;
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'kutt') THEN
        CREATE USER kutt WITH PASSWORD '331155';
    END IF;
    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'kutt') THEN
        CREATE DATABASE kutt OWNER kutt;
    END IF;
END
$$;

