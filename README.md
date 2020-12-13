# nanoid-postgres
Nanoid implementation in PostgreSQL PL/pgSQL

## Requirements
* Postgres with pgcrypto

## Usage
Run the SQL file, or include the function in your database migrations

Use as the default value for your id columns!
```sql
CREATE TABLE users (
  "id" char(21) NOT NULL DEFAULT nanoid(),
  ...
)
```

To customise the alphabet simply modify the variable