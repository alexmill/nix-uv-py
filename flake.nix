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
            export VENV_DIR=".venv"
            export UV_VENV_PATH="$VENV_DIR"
            # Create venv if missing
            if [ ! -d "$VENV_DIR" ]; then
              ${python}/bin/python -m venv "$VENV_DIR" > /dev/null 2>&1
              source "$VENV_DIR/bin/activate" > /dev/null 2>&1
              uv pip install -e . > /dev/null 2>&1
            else
              source "$VENV_DIR/bin/activate" > /dev/null 2>&1
            fi
            echo "✅ Python dev shell ready (.venv active, uv deps installed)"
          '';
        };
      }
    );
}