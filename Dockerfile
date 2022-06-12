FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
COPY published/ ./
ENTRYPOINT ["dotnet", "Game-Statistics-Service.dll"]
