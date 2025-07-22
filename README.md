# uv-python-project

This repository provides a simple boilerplate template for creating new Python projects using [Nix](https://nixos.org/) and [uv](https://github.com/astral-sh/uv) for dependency management and virtual environments.

## Features
- **Nix Flake Integration**: Easily reproducible development environments using Nix flakes.
- **uv for Python**: Fast Python dependency management and virtual environment creation with uv.
- **Editable Installs**: Local package installed in editable mode for rapid development.
- **Automatic venv Setup**: Shell hook automatically creates and activates a `.venv` if it doesn't exist.
- **Single Dependency Source**: All Python dependencies are managed via `pyproject.toml`.

## Getting Started

### Prerequisites
- [Nix](https://nixos.org/download.html) installed on your system.
- [direnv](https://direnv.net/) (recommended for automatic environment activation).

### Usage
1. **Clone this template:**
   ```sh
   git clone <this-repo-url> my-new-project
   cd my-new-project
   ```
2. **Allow direnv (if using):**
   ```sh
   direnv allow
   ```
3. **Enter the development shell:**
   ```sh
   nix develop
   ```
   This will:
   - Create a `.venv` if it doesn't exist
   - Activate the virtual environment
   - Install dependencies and the local package in editable mode using uv

4. **Start coding!**
   - Add your dependencies to `pyproject.toml`
   - Your environment is ready for development

## Project Structure
- `flake.nix`: Nix flake for reproducible dev environments
- `.envrc`: direnv config to load the flake
- `pyproject.toml`: Python project metadata and dependencies
- `.venv/`: Auto-created Python virtual environment

## Customization
- Edit `pyproject.toml` to add/remove dependencies
- Modify `flake.nix` for additional Nix packages or shell customizations

