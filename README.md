Certainly! Here's the updated README for the Plant Social Server backend that includes sections for contributing and reporting issues:

# Plant Social Server

Plant Social Server is a Ruby on Rails backend application that serves as the server for the Plant Social Client. It provides API endpoints for creating, retrieving, and managing plant-related data, including user accounts, plant records, care notes, and more.

## Table of Contents

- [Ruby version](#ruby-version)
- [System dependencies](#system-dependencies)
- [Configuration](#configuration)
- [Database creation](#database-creation)
- [Database initialization](#database-initialization)
- [How to run the test suite](#how-to-run-the-test-suite)
- [Services](#services)
- [Deployment instructions](#deployment-instructions)
- [Environment Variables](#environment-variables)
- [Starting the Rails Server](#starting-the-rails-server)
- [API Endpoints](#api-endpoints)
- [Frontend Repository](#frontend-repository)
- [Contributing](#contributing)
- [Reporting Issues](#reporting-issues)

## Ruby version

Plant Social Server uses Ruby version 2.7.4.

## System dependencies

In order to run Plant Social Server, you need to ensure that the following system dependencies are met:

- Ruby (version 2.7.4)
- PostgreSQL (for the database)
- Puma (as the application server)
- Redis (for Action Cable, if needed)

## Configuration

The project's dependencies are managed using Bundler. Ensure you have Bundler installed and run:

```bash
bundle install
```

## Database creation

To create the PostgreSQL database, run the following commands:

```bash
rails db:create
rails db:migrate
```

## Database initialization

You can seed the database with initial data using:

```bash
rails db:seed
```

## How to run the test suite

To run the test suite, use the following command:

```bash
rails test
```

## Services

Plant Social Server provides services for user authentication, plant data management, image storage (via AWS S3), and more. These services are available through the API endpoints provided by the server.

## Deployment instructions

You can deploy Plant Social Server to your preferred hosting service. Some common options for deploying a Ruby on Rails application include:

- Heroku
- Render
- AWS Elastic Beanstalk
- DigitalOcean
- Google Cloud Platform

Make sure to configure the necessary environment variables on your deployment platform as described in the next section.

## Environment Variables

Plant Social Server requires the following environment variables to be set:

- `algo`: Used for bcrypt encryption.
- `jwt_secret`: Used for JWT encoding and decoding.
- `aws_access_key_id`: Required for image storage on AWS S3.
- `aws_bucket`: Required for image storage on AWS S3.
- `aws_secret_access_key`: Required for image storage on AWS S3.
- `region`: Required for image storage on AWS S3.

Ensure that you have these environment variables set in your production environment.

## Starting the Rails Server

To start the Rails server, use the following command:

```bash
rails s
```

The server will start, and you can access it at `http://localhost:3000`.

## API Endpoints

Most API endpoints are prefixed with `/api/v1`. For example, to access the endpoint for creating a new plant record, you would use:

```
POST http://localhost:3000/api/v1/plants
```

Make sure to include the `/api/v1` prefix when making API requests.

However, image endpoints are not prefixed with `/api/v1`

## Frontend Repository

The frontend for this backend is located at [Plant Social Client](https://github.com/emileypalmquist/plant-social-client). You can find more information about the frontend, its setup, and how it interacts with the Plant Social Server backend in that repository.

## Contributing

We welcome contributions from the community. If you'd like to contribute to Plant Social Server, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix: `git checkout -b feature/your-feature-name` or `git checkout -b bugfix/your-bug-fix`.
3. Make your changes and commit them.
4. Push your changes to your fork: `git push origin feature/your-feature-name`.
5. Create a pull request to the main repository.

## Reporting Issues

If you encounter any issues or have suggestions for improvements, please feel free to [create an issue](https://github.com/emileypalmquist/plant-social-server/issues) in the GitHub repository. We appreciate your feedback and will address the issues promptly.

Happy gardening! 🌱🌿