#FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
#WORKDIR /app
#COPY published/ ./
#ENTRYPOINT ["dotnet", "Game-Statistics-Service.dll"]
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:5001
EXPOSE 5001

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["MoveService/MoveService.csproj", "MoveService/"]
RUN dotnet restore "MoveService/MoveService.csproj"
COPY . .
WORKDIR "/src/MoveService"
RUN dotnet build "MoveService.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MoveService.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MoveService.dll"]