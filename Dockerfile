FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /Game-Statistics-Service
COPY [GameStatisticsService/GameStatisticsService.csproj, ./]
ENTRYPOINT ["dotnet", "Game-Statistics-Service.dll"]
