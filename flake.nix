# my-python-project/flake.nix
{
  description = "A development shell for a Python project using uv";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python = pkgs.python311;
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            python
            pkgs.uv
          ];

          shellHook = ''
            echo "✨ Entering uv-based Python development shell..."

            export VENV_DIR=".venv"
            export UV_VENV_PATH="''${VENV_DIR}"

            if [ ! -d "$VENV_DIR" ]; then
              echo "Creating virtual environment in $VENV_DIR..."
              ${python}/bin/python -m venv "$VENV_DIR"
            fi

            source "$VENV_DIR/bin/activate"

            echo "Installing local package in editable mode with uv..."
            uv pip install -e .

            echo "✅ Done. The venv is active, dependencies and local package are installed."
          '';
        };
      }
    );
}