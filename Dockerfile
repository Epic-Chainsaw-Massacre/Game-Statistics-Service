# Build
FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS build
WORKDIR /source
COPY . .
RUN dotnet restore "./GameStatisticsService/GameStatisticsService.csproj" --disable-parallel
RUN dotnet publish "./GameStatisticsService/GameStatisticsService.csproj" -c release -o /app --no-restore

# Run
FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal
WORKDIR /app
COPY --from=build /app ./

ENTRYPOINT ["dotnet", "GameStatisticsService.dll"] 
