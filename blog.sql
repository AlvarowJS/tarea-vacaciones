CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "roles_id" int
);
CREATE TABLE "posts" (
  "id" serial PRIMARY KEY,
  "user_id" int,
  "title" varchar(30) NOT NULL,
  "content" text NOT NULL,
  "date" timestamp NOT NULL,
  "created_at" timestamp
);
CREATE TABLE "comments" (
  "id" serial PRIMARY KEY,
  "user_id" int,
  "post_id" int,
  "comment" varchar(255) NOT NULL 
);
CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name_rol" varchar NOT NULL
);
ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");
ALTER TABLE "users" ADD FOREIGN KEY ("roles_id") REFERENCES "roles" ("id");

-- roles
insert into roles (name_rol) values ('blogger'),('sub'),('admin');
-- users 
insert into users (
    name,
    email,
    "password",
    roles_id 
) values (
    'Alvaro',
    'alvaro@gmail.com',
    'alvaro',
    1
),(
    'Guillermo',
    'guillermo@gmail.com',
    '1234',
    2
),(
    'Luis',
    'luis@gmail.com',
    'root',
    3
),(
    'Juan',
    'juan@gmail.com',
    'root',
    3
);
-- posts 
insert into posts (
    user_id, 
    title, 
    "content", 
    "date",
    created_at 
) values (
    3,
    'reglas del blog',
    'reglas del blog bla bla bla bla',
    '2022-07-28 21:53:00',
    '2022-07-28 21:53:00'
),(
    1,
    'El back es mejor que el front',
    'porque si bla bla bla bla',
    '2022-07-28 21:53:00',
    '2022-07-28 21:53:00'
),(
    1,
    'El front e mejor que el back',
    'Nose bla bla bla bla',
    '2022-07-28 21:53:00',
    '2022-07-28 21:53:00'
);
insert into "comments" (
    user_id,
    post_id,
    "comment" 
) values (
    1,
    2,
    'FUNNY '
    
), (
    2,
    2,
    'TRUE  '
), (
    1,
    2,
    'REALLY FUNNY '
)