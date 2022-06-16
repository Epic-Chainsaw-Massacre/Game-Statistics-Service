
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

FROM base AS final
WORKDIR /app
copy --from=publish /app/publish .
ENTRYPOINT ["dotnet", "GameStatisticsService.dll"]

#FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
#WORKDIR /app
#ENV ASPNETCORE_URLS=http://+:5001
#EXPOSE 5001
#
#FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
#WORKDIR /src
#COPY ["GameStatisticsService/GameStatisticsService.csproj", "GameStatisticsService/"]
#RUN dotnet restore "GameStatisticsService.csproj"
#COPY . .
#WORKDIR "/src/GameStatisticsService"
#RUN dotnet build "GameStatisticsService.csproj" -c Release -o /app/build
#
#FROM build AS publish
#RUN dotnet publish "GameStatisticsService.csproj" -c Release -o /app/publish
#
#FROM base AS final
#WORKDIR /Game-Statistics-Service
#COPY GameStatisticsService/ ./
#ENTRYPOINT ["dotnet", "GameStatisticsService.dll"]
