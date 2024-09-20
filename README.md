# Air/Templ Live Reload Example

This project demonstrates a basic setup for live reloading a Go web application using Air, Templ, and Gin. It provides a simple example of how to configure these tools to work together for a smooth development experience.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Project Structure](#project-structure)
5. [Running the Application](#running-the-application)
6. [Development Workflow](#development-workflow)
7. [Makefile Commands](#makefile-commands)
8. [Package Details](#package-details)
9. [Troubleshooting](#troubleshooting)

## Project Overview

This project is a minimal example of a Go web application that uses:

- [Gin](https://github.com/gin-gonic/gin) as the web framework
- [Templ](https://github.com/a-h/templ) for HTML templating
- [Air](https://github.com/cosmtrek/air) for live reloading during development

The application serves a simple HTML page that greets a user by name, demonstrating the basic setup for live reloading with Templ templates.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Go (version 1.23.1 or later)
- Make

## Installation

1. Clone this repository:
   ```
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Install the required Go packages:
   ```
   go mod tidy
   ```

3. Install global tools:

   - Install Air:
     ```
     go install github.com/cosmtrek/air@latest
     ```

   - Install Templ:
     ```
     go install github.com/a-h/templ/cmd/templ@latest
     ```

   - Install Repopack (optional, for generating AI-friendly code summaries):
     ```
     go install github.com/yamadashy/repopack@latest
     ```

## Project Structure

- `main.go`: The main application file
- `index.templ`: Templ template file for the HTML page
- `index_templ.go`: Generated Go file from the Templ template
- `Makefile`: Contains useful commands for building and running the project
- `.air.toml`: Configuration file for Air
- `go.mod` and `go.sum`: Go module files
- `repopack.config.json`: Configuration file for Repopack

## Running the Application

To run the application in development mode with live reloading:

```
make dev
```

This command will start the application using Air, which will watch for file changes and automatically rebuild and restart the server.

To run the application without live reloading:

```
make run
```

## Development Workflow

1. Make changes to your Go code or Templ templates.
2. Air will detect the changes and automatically rebuild and restart the server.
3. Refresh your browser to see the changes.

Note: When you modify `.templ` files, Air will trigger Templ to generate the corresponding Go files before rebuilding the application.

## Makefile Commands

- `make build`: Builds the application
- `make run`: Builds and runs the application
- `make clean`: Cleans up the `./tmp` folder
- `make dev`: Runs the application with live reloading using Air
- `make deps`: Resolves project dependencies
- `make repopack`: Generates an AI-friendly file for code summarization
- `make help`: Displays help information about the Makefile commands

## Package Details

### Gin

Gin is a web framework for Go that features a martini-like API with performance that is up to 40 times faster. It provides a robust set of features for building web applications and microservices.

Installation: Gin is installed as a project dependency via `go mod tidy`.

### Templ

Templ is a HTML templating language for Go that helps you write components that render HTML. It generates Go code that can be executed to render HTML.

Installation:
1. Install the Templ command-line tool:
   ```
   go install github.com/a-h/templ/cmd/templ@latest
   ```
2. Templ is also installed as a project dependency via `go mod tidy`.

### Air

Air is a live reloading command line utility for Go applications in development. It watches your files, builds, and restarts the app on changes.

Installation:
```
go install github.com/cosmtrek/air@latest
```

### Repopack

Repopack is a tool that generates an AI-friendly summary of your codebase. It's optional for this project but can be useful for documentation purposes.

Installation:
```
go install github.com/yamadashy/repopack@latest
```

## Troubleshooting

- If you encounter any issues with live reloading, ensure that the `.air.toml` file is correctly configured and that you're running the application using `make dev`.
- If Templ files are not generating correctly, try running `templ generate` manually to see if there are any errors in your Templ syntax.
- Make sure all required global tools (Air, Templ) are correctly installed and available in your system PATH.
- If you're having trouble with Go module dependencies, try deleting the `go.sum` file and running `go mod tidy` again.

For any other issues, please check the official documentation of the respective tools or create an issue in the project repository.
