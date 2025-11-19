# Data Science Project Template

[![Ministry of Justice Repository Compliance Badge](https://github-community.service.justice.gov.uk/repository-standards/api/data-science-template/badge)](https://github-community.service.justice.gov.uk/repository-standards/data-science-template)
[![Pre-commit](https://github.com/moj-analytical-services/data-science-template/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/moj-analytical-services/data-science-template/actions/workflows/pre-commit.yml)
[![Pytest](https://github.com/moj-analytical-services/data-science-template/actions/workflows/pytest.yml/badge.svg)](https://github.com/moj-analytical-services/data-science-template/actions/workflows/pytest.yml)

A comprehensive template repository for data science projects on the Analytical Platform, supporting both Python and R development with built-in code quality tools, testing frameworks, and CI/CD workflows.

> [!NOTE]
> We are currently in development and suggestions are welcome! Open [an issue here](https://github.com/moj-analytical-services/data-science-template/issues/new/choose).

## Quick Start

1. **Create your repository** from this template:
   - Click the green "Use this template" button at the top of this repository
   - Select "Create a new repository"
   - Name your repository and choose visibility settings

2. **Clone your new repository**:

   ```bash
   git clone https://github.com/moj-analytical-services/your-repo-name.git
   cd your-repo-name
   ```

3. **Set up your development environment**. Follow the [Setup Instructions](#setup-instructions) below

4. **Update the README** to reflect your project and [correct the update badge links](#modify-the-github-standards-badge)

5. **Start building!**

## Features

This template provides a robust foundation for data science projects:

- **🐍 Python, 🗄️ SQL & 📊 R Support**: Pre-configured for all three languages with formatting and testing
- **✅ Code Quality Tools**: Pre-commit hooks for automated formatting, linting, and security checks
- **🧪 Testing Framework**: Three-tier test structure (unit, integration, end-to-end) with pytest and testthat
- **🔒 Security Scanning**: Bandit for Python security, secrets detection, and container vulnerability scanning, as well as large file detection and nbstripout to detect if you're about to commit data
- **📝 Architecture Decision Records**: Built-in ADR tooling for documenting important decisions
- **🐳 Docker Ready**: Dockerfile included for containerized deployments on airflow using the Analytical platform workflow
- **🤖 CI/CD Workflows**: GitHub Actions for automated testing, container builds, and releases to to the ECS for use with Airflow on the analytical platform.
- **📚 Comprehensive Documentation**: README templates, ADR examples, and test documentation
- **🔄 PR and issue templates** to match common data science ways of working



## Included Files

The repository comes with the following preset files:

- GitHub Actions workflows
  - ⚠️ (temporarily disabled) Dependency review (if your repository is public) (`.github/workflows/dependency-review.yml`)
  - Container release to Analytical Platform's ECR (`.github/workflows/release-container.yml`)
  - Container scan with Trivy (`.github/workflows/scan-container.yml`)
  - Container structure test (`.github/workflows/test-container.yml`)
- CODEOWNERS
- Dependabot configuration
- Dockerfile
- MIT License
- Pre-commit hooks configuration (`.pre-commit-config.yaml`)
- Development dependencies (`requirements-dev.txt`)
- Architecture Decision Records (`docs/adr/`)

### Code Standards and Quality

This template includes pre-commit hooks for automated code quality checks. The hooks cover:

- **Python**: Black formatting, Flake8 linting, Bandit security checks
- **R**: styler formatting, lintr linting (requires R packages: `install.packages(c("styler", "lintr"))`)
- **SQL**: SQLFluff linting and formatting
- **Notebooks**: nbstripout to remove outputs
- **General**: trailing whitespace, file size limits, secrets detection

After setting up your environment, the hooks will run automatically on each commit. You can also run them manually:

```bash
pre-commit run --all-files
```

### Testing

The template includes a three-tier testing structure:

- **Unit Tests** (`tests/unit/`): Test individual functions and components in isolation
- **Integration Tests** (`tests/integration/`): Test how components work together
- **End-to-End Tests** (`tests/e2e/`): Test complete workflows from start to finish

Each test directory contains a README with specific guidance. Example tests are provided for both Python (pytest) and R (testthat).

**Run Python tests:**

```bash
# Run unit and integration tests (default - excludes e2e)
pytest

# Run specific test types
pytest tests/unit/           # Unit tests only
pytest -m integration        # Integration tests only
pytest -m e2e                # E2E tests only (not recommended, use Docker)
```

**Run E2E tests in Docker (recommended):**

```bash
# Build and run e2e tests in container (includes test data)
docker build -f Dockerfile.test -t test-image .
docker run --rm test-image
```

> [!NOTE]
> E2E tests are excluded from default pytest runs. They're marked with `@pytest.mark.e2e` and designed to run in Docker.

**Run R tests:**

```R
# In R console
testthat::test_dir("tests/unit")
```

See the [tests README](tests/README.md) for more details on the testing strategy.

## Setup Instructions

Once you've created your repository using this template, ensure the following steps:

### Set Up Development Environment

We are aligned with the [analytical platform's guidance](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/getting-started/cloud-platform-cli.html#cloud-platform-cli) on setting up a Python development environment.

1. **Create a virtual environment** (in your project directory):

   ```bash
   python3 -m venv venv
   ```

   Add `venv` to your `.gitignore` file (already included in this template).

2. **Activate the virtual environment**:

   ```bash
   source venv/bin/activate  # On macOS/Linux
   # or
   venv\Scripts\activate  # On Windows
   ```

   You'll see `(venv)` in your terminal prompt when activated.

3. **Install development dependencies**:

   ```bash
   pip install -r requirements-dev.txt
   ```

4. **Install pre-commit hooks** (for code quality):

   ```bash
   pre-commit install
   ```

5. **Install project dependencies** (when you have a `requirements.txt`):

   ```bash
   pip install -r requirements.txt
   ```

6. **Record your dependencies**:

   When you add new packages, update the requirements file:

   ```bash
   pip freeze > requirements.txt
   git add requirements.txt
   ```

### Set Up R Development Environment (Optional)

If you're working with R:

1. **Install R** (if not already installed):

   Follow the [R installation guide](https://cloud.r-project.org/) for your operating system.

2. **Install required R packages** for code quality:

   ```R
   # In R console
   install.packages(c("styler", "lintr", "testthat"))
   ```

3. **Install project-specific R packages**:

   Create a file called `install_packages.R` in your project root and list your dependencies:

   ```R
   # install_packages.R
   packages <- c(
     "dplyr",
     "ggplot2",
     "tidyr"
     # Add your packages here
   )

   install.packages(packages)
   ```

   Run it with: `Rscript install_packages.R`

4. **Alternative - Use renv for dependency management**:

   ```R
   # Initialize renv for your project
   install.packages("renv")
   renv::init()

   # Install packages (they'll be tracked by renv)
   install.packages("dplyr")

   # Create a snapshot of your dependencies
   renv::snapshot()
   ```

### Update README

Edit this README.md file to document your project accurately. Take the time to create a clear, engaging, and informative README.md file. Include information like what your project does, how to install and run it, how to contribute, and any other pertinent details.

### Update repository description

After you've created your repository, GitHub provides a brief description field that appears on the top of your repository's main page. This is a summary that gives visitors quick insight into the project. Using this field to provide a succinct overview of your repository is highly recommended.

This description and your README.md will be one of the first things people see when they visit your repository. It's a good place to make a strong, concise first impression. Remember, this is often visible in search results on GitHub and search engines, so it's also an opportunity to help people discover your project.

### Grant Team Permissions

Assign permissions to the appropriate Ministry of Justice teams. Ensure at least one team is granted Admin permissions. Whenever possible, assign permissions to teams rather than individual users.

### Read about the GitHub repository standards

Familiarise yourself with the [Ministry of Justice GitHub Repository Standards](https://user-guide.operations-engineering.service.justice.gov.uk/documentation/information/mojrepostandards.html). These standards ensure consistency, maintainability, and best practices across all our repositories.

Please read and understand these standards thoroughly and enable them when you feel comfortable.

### Modify the GitHub Standards Badge

Once you've ensured that all the [GitHub Repository Standards](https://user-guide.operations-engineering.service.justice.gov.uk/documentation/information/mojrepostandards.html) have been applied to your repository, it's time to update the Ministry of Justice (MoJ) Compliance Badge located in the README file.

The badge demonstrates that your repository is compliant with MoJ's standards. Please follow these [instructions](https://user-guide.operations-engineering.service.justice.gov.uk/documentation/information/add-repo-badge.html) to modify the badge URL to reflect the status of your repository correctly.

**Please note** the badge will not function correctly if your repository is internal or private. In this case, you may remove the badge from your README.

### Manage Outside Collaborators

To add an Outside Collaborator to the repository, follow the [guidelines for managing GitHub collaborators](https://github.com/ministryofjustice/github-collaborators).

### Update CODEOWNERS

(Optional) Modify the CODEOWNERS file to specify the teams or users authorized to approve pull requests.

### Configure Dependabot

Adapt the dependabot.yml file to match your project's [dependency manager](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file#package-ecosystem) and to enable [automated pull requests for package updates](https://docs.github.com/en/code-security/supply-chain-security).

### Dependency Review

If your repository is private with no GitHub Advanced Security license, remove the `.github/workflows/dependency-review.yml` file.

## Contributing

We welcome contributions and suggestions! Here's how you can help:

1. **Report Issues**: Found a bug or have a feature request? [Open an issue](https://github.com/moj-analytical-services/data-science-template/issues/new/choose)

2. **Suggest Improvements**: Have ideas for improving this template? Create an issue with the "enhancement" label

3. **Submit Pull Requests**:
   - Fork the repository
   - Create a feature branch (`git checkout -b feature/improvement`)
   - Make your changes and commit (`git commit -am 'Add new feature'`)
   - Push to the branch (`git push origin feature/improvement`)
   - Open a Pull Request

4. **Document Decisions**: For significant architectural changes, create an [Architecture Decision Record](docs/adr/README.md) using:

   ```bash
   adr-new "Your decision title"
   ```

### Code of Conduct

This project follows the [Ministry of Justice's Code of Conduct](https://user-guide.operations-engineering.service.justice.gov.uk/documentation/information/mojrepostandards.html). Please be respectful and professional in all interactions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

This license may not be appropriate for all projects, because it gives permission to anyone with access to the repo to open source a copy of it. Please review and change the license as necessary for your project.
