CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE FUNCTION nanoid(
  size int DEFAULT 21,
  alphabet varchar DEFAULT 'ModuleSymbhasOwnPr-0123456789ABCDEFGHNRVfgctiUvz_KqYTJkLxpZXIjQW'
) RETURNS text AS $$
DECLARE
  id text := '';
  i int := 0;
  len int := length(alphabet);
  bytes bytea := gen_random_bytes(size);
  byte int;
  pos int;
BEGIN
  WHILE i < size LOOP
    byte := get_byte(bytes, i);
    pos := (byte & (len - 1)) + 1; -- + 1 because substr starts at 1 for some reason
    id := id || substr(alphabet, pos, 1);
    i = i + 1;
  END LOOP;
  RETURN id;
END
$$ LANGUAGE PLPGSQL STABLE;
