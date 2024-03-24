db = db.getSiblingDB('mail');
db = db.getSiblingDB("laravel_db");
db = db.getSiblingDB("rails_db");
db = db.getSiblingDB("django_db");
db = db.getSiblingDB("echo_db");
db.createUser({
    user: "root",
    pwd: "password",
    roles: [
        {role: "root", db: "mail"},
        {role: "root", db: "laravel_db"},
        {role: "root", db: "rails_db"},
        {role: "root", db: "django_db"},
        {role: "root", db: "echo_db"},
    ]
});
// db.createUser({
//     user: "root",
//     pwd: "password",
//     roles: [
//         { role : "dbOwner", db : "main" },
//         { role : "dbAdmin", db : "main" },
//         { role : "readWrite", db : "main" },
//     ]
// });