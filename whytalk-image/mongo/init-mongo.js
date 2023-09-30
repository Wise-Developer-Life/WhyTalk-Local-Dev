const  {
    MONGO_INITDB_USERNAME,
    MONGO_INITDB_PASSWORD,
    MONGO_INITDB_DATABASE,
} = process.env;

db.createUser(
    {
        user: MONGO_INITDB_USERNAME,
        pwd: MONGO_INITDB_PASSWORD,
        roles: [{
            role: 'readWrite',
            db: MONGO_INITDB_DATABASE
        }
        ]
    }
);
