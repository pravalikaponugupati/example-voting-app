# Use the official .NET Core SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project file and restore dependencies
COPY *.csproj .
RUN dotnet restore

# Copy the remaining source code
COPY . .

# Build the application
RUN dotnet build -c Release --no-restore

# Run the application
CMD ["dotnet", "run"]
