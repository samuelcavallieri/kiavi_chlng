# Spina CMS Project Setup

## Project Overview
This project provides a Dockerized development environment for a Spina CMS application. It allows developers to quickly set up and run a Spina CMS instance locally using Docker Compose.

## Technologies Used
* Spina CMS: Version 2.18.0
* Ruby: Version 3.2.6
* Rails: Version 7.0.0
* Docker: For containerized development
* PostgreSQL: Database

## Features
* **Dockerized environment:** Simplifies setup and ensures consistency across different development machines
* **Database migrations:** Automatically runs database migrations on startup
* **Pre-configured database:** Uses PostgreSQL with pre-defined credentials for easy setup

## Setup Instructions

### Prerequisites
* Docker and Docker Compose installed on your machine

### Installation Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/samuelcavallieri/kiavi_chlng.git
   cd kiavi_chlng
   ```

2. Build and start the application:
   ```bash
   docker-compose build
   docker-compose up -d
   ```

3. Access the application:
   * Open your browser and navigate to `http://localhost:3000/admin` to access the Spina CMS admin panel

## Common Issues

### Active Storage Tables Missing
If you encounter: `PG::UndefinedTable: ERROR: relation "active_storage_attachments" does not exist`

Run these commands:
```bash
docker-compose exec web rails active_storage:install
docker-compose exec web rails db:migrate
docker-compose restart web
```

## Development Workflow

### Making Code Changes
1. Make changes to the application code in your local environment
2. Rebuild and restart the Docker containers:
   ```bash
   docker-compose up -d --build
   ```

### Database Changes
When making database schema changes:
```bash
docker-compose exec web rails db:migrate
```

References
Spina CMS Documentation
Rails Official Guides
Docker Documentation
Docker Compose Documentation
PostgreSQL Documentation


## Future Improvements
* Automated tests using RSpec
* CI/CD integration with GitHub Actions
* AWS deployment using ECS with Fargate
* S3 integration for file storage

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.