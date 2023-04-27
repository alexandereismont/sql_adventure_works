# SQL ADVENTURE WORKS 

## Dataset and setup
Tutorial: https://github.com/lorint/AdventureWorks-for-Postgres

### Log in
```sql
psql -U postgres
```

### Create database
```
psql -c "CREATE DATABASE \"Adventureworks\";" -U postgres

OR

CREATE DATABASE Awesomeworks;
```

### Add install.sql to docker container
```docker
docker cp install.sql adventure_works-db-1:/install.sql
```

### Init database
Copy csv files and sql file to git repo from above. Run then the following command 
```zsh
psql -d Adventureworks < install.sql -U <username>
```