FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["GameStatisticsService/GameStatisticsService.csproj", "GameStatisticsService/"]
RUN dotnet restore "GameStatisticsService/GameStatisticsService.csproj"
COPY . .
WORKDIR "/src/GameStatisticsService"
RUN dotnet build "GameStatisticsService.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "GameStatisticsService.csproj" -c Release -o /app/build

FROM build AS final
WORKDIR /app
ENTRYPOINT ["dotnet", "GameStatisticsService.dll"]

#COPY --from=publish /app/publish .
