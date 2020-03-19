{ pkgs ? import ./nix/pinned-nixpkgs.nix {} }:

let
  python = pkgs.python38Packages;

  devPythonPkgs = with python; [
  ];

  devScalaPkgs = with pkgs; [
    sbt
    scala
    scalafix
  ];

  # None of these packages are installed
  # globally.
  systemPkgs = with pkgs; [
    poetry
    python38Full
  ];
in
pkgs.mkShell rec {
  name = "env";
  buildInputs = systemPkgs ++ devPythonPkgs ++ devScalaPkgs;
}
