{ pkgs ? import ../nix/pinned-nixpkgs.nix {} }:

let
  devScalaPkgs = with pkgs; [
    sbt
    scala
    scalafix
  ];

  systemPkgs = with pkgs; [
  ];
in
pkgs.mkShell rec {
  name = "env";
  buildInputs = systemPkgs ++ devScalaPkgs;
}
