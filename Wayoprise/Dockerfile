# docker build -t us-central1-docker.pkg.dev/surferjeff-demos/docker-repo/legacy-spa-finish:v2 .
# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.sln .
COPY *.csproj .
RUN dotnet restore

# copy everything else and build app
COPY . .
RUN dotnet publish -c release -o /app

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "Wayoprise.dll"]

ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_LOGGING__CONSOLE__DISABLECOLORS=true