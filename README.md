# PROGY3S1-API
API For Ecommerce App

Done for PROG 7311 POE. [API Client here](https://github.com/Reuel-T/PROGY3S1-Web)


# Setup

Run `DBScript.sql` in SQL Server to create the required database

Get the connection string to the created database and place it in `appsettings.json`.

```json
{
  "ConnectionStrings": {
    "con": "PLACE YOUR SQL SERVER DB CONNECTION STRING HERE"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft": "Warning",
      "Microsoft.Hosting.Lifetime": "Information"
    }
  },
  "AllowedHosts": "*"
}
```
Once done, build and run the app
