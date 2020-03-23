{ pkgs ? import ../nix/pinned-nixpkgs.nix {} }:

let
  python = pkgs.python37Packages;

  devPythonPkgs = with python; [
  ];

  systemPkgs = with pkgs; [
    poetry
    python37Full
  ];
in
pkgs.mkShell rec {
  name = "env";
  buildInputs = systemPkgs ++ devPythonPkgs;
  shellHook = ''
    mkdir -p -- "$(pwd)/.cache/pypoetry"
    poetry config cache-dir $(pwd)/.cache/pypoetry --local
    poetry config virtualenvs.in-project true --local

    export PATH="$(pwd)/.venv/bin:$PATH"
  '';
}
