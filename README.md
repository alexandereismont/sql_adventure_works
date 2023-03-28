# SQL ADVENTURE WORKS 

## Dataset and setup
Tutorial: https://github.com/lorint/AdventureWorks-for-Postgres

### Create database
```sql
CREATE DATABASE Awesomeworks;
```

### Init database
Copy csv files and sql file to git repo from above. Run then the following command 
```zsh
psql -d Adventureworks < install.sql -U <username>
```