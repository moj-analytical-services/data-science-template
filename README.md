# Analytical Platform Airflow Python Template

[![Ministry of Justice Repository Compliance Badge](https://github-community.service.justice.gov.uk/repository-standards/api/analytical-platform-airflow-python-template/badge)](https://github-community.service.justice.gov.uk/repository-standards/analytical-platform-airflow-python-template)
[![Pre-commit](https://github.com/moj-analytical-services/data-science-template/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/moj-analytical-services/data-science-template/actions/workflows/pre-commit.yml)

This template repository equips you with the default initial files required for an Analytical Platform Airflow workflow.

## Included Files

The repository comes with the following preset files:

- GitHub Actions workflows
  - Dependency review (if your repository is public) (`.github/workflows/dependency-review.yml`)
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

## Code Quality

This template includes pre-commit hooks for automated code quality checks. The hooks cover:

- **Python**: Black formatting, Flake8 linting, Bandit security checks
- **R**: styler formatting, lintr linting
- **SQL**: SQLFluff linting and formatting
- **Notebooks**: nbstripout to remove outputs
- **General**: trailing whitespace, file size limits, secrets detection

After setting up your environment, the hooks will run automatically on each commit. You can also run them manually:

```bash
pre-commit run --all-files
```

## Setup Instructions

Once you've created your repository using this template, ensure the following steps:

### Set Up Development Environment

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

**Note:** You may need to delete the `.bash_aliases` file (`rm ~/.bash_aliases`) from your home directory for pip to work properly within a virtual environment.

### Update README

Edit this README.md file to document your project accurately. Take the time to create a clear, engaging, and informative README.md file. Include information like what your project does, how to install and run it, how to contribute, and any other pertinent details.

### Update repository description

After you've created your repository, GitHub provides a brief description field that appears on the top of your repository's main page. This is a summary that gives visitors quick insight into the project. Using this field to provide a succinct overview of your repository is highly recommended.

This description and your README.md will be one of the first things people see when they visit your repository. It's a good place to make a strong, concise first impression. Remember, this is often visible in search results on GitHub and search engines, so it's also an opportunity to help people discover your project.

### Grant Team Permissions

Assign permissions to the appropriate Ministry of Justice teams. Ensure at least one team is granted Admin permissions. Whenever possible, assign permissions to teams rather than individual users.

### Read about the GitHub repository standards

Familiarise yourself with the Ministry of Justice GitHub Repository Standards. These standards ensure consistency, maintainability, and best practices across all our repositories.

You can find the standards [here](https://user-guide.operations-engineering.service.justice.gov.uk/documentation/information/mojrepostandards.html).

Please read and understand these standards thoroughly and enable them when you feel comfortable.

### Modify the GitHub Standards Badge

Once you've ensured that all the [GitHub Repository Standards](https://user-guide.operations-engineering.service.justice.gov.uk/documentation/information/mojrepostandards.html) have been applied to your repository, it's time to update the Ministry of Justice (MoJ) Compliance Badge located in the README file.

The badge demonstrates that your repository is compliant with MoJ's standards. Please follow these [instructions](https://user-guide.operations-engineering.service.justice.gov.uk/documentation/information/add-repo-badge.html) to modify the badge URL to reflect the status of your repository correctly.

**Please note** the badge will not function correctly if your repository is internal or private. In this case, you may remove the badge from your README.

### Manage Outside Collaborators

To add an Outside Collaborator to the repository, follow the guidelines detailed [here](https://github.com/ministryofjustice/github-collaborators).

### Update CODEOWNERS

(Optional) Modify the CODEOWNERS file to specify the teams or users authorized to approve pull requests.

### Configure Dependabot

Adapt the dependabot.yml file to match your project's [dependency manager](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file#package-ecosystem) and to enable [automated pull requests for package updates](https://docs.github.com/en/code-security/supply-chain-security).

### Dependency Review

If your repository is private with no GitHub Advanced Security license, remove the `.github/workflows/dependency-review.yml` file.
