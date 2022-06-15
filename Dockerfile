#FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
#WORKDIR /app
#COPY published/ ./
#ENTRYPOINT ["dotnet", "Game-Statistics-Service.dll"]

#FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
#WORKDIR /app
#ENV ASPNETCORE_URLS=http://+:5001
#EXPOSE 5001
#
#FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
#WORKDIR /src
#COPY ["Game-Statistics-Service/Game-Statistics-Service.csproj", "Game-Statistics-Service/"]
#RUN dotnet restore "Game-Statistics-Service/Game-Statistics-Service.csproj"
#COPY . .
#WORKDIR "/src/Game-Statistics-Service"
#RUN dotnet build "Game-Statistics-Service.csproj" -c Release -o /app/build
#
#FROM build AS publish
#RUN dotnet publish "Game-Statistics-Service.csproj" -c Release -o /app/publish
#
#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app/publish .
#ENTRYPOINT ["dotnet", "Game-Statistics-Service.dll"]

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.csproj .
RUN dotnet restore

# copy and publish app and libraries
COPY . .
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/runtime:6.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "GameStatisticsService.dll"]