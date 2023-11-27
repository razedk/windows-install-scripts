@echo off

echo Pulling image from docker hub
docker pull mcr.microsoft.com/mssql/server:2022-latest

echo Creating SQL server 2022 container
docker run -e "ACCEPT_EULA=Y" -e "CHECK_POLICY=OFF" -e "MSSQL_SA_PASSWORD=1Password" -p 1433:1433 --name "SQL_Server_2022" --hostname sqlserver2022 -d mcr.microsoft.com/mssql/server:2022-latest

echo Done... you should now be able to connect to SQL server