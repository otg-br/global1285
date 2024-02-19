dofile('data/startup/tables/tables.lua')
dofile('data/startup/others/others.lua')
print("Liberada a criacao de contas")
db.query("SET GLOBAL sql_mode = '';")
