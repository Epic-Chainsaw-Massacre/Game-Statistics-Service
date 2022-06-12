FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /Game-Statistics-Service
COPY published/, ./
ENTRYPOINT ["dotnet", "Game-Statistics-Service.dll"]
