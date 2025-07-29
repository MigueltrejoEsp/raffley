{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell
{
  nativeBuildInputs = with pkgs; [
    beamMinimalPackages.elixir
    beamMinimalPackages.erlang
      beamMinimalPackages.elixir-ls
    #inotify-tools
  ];

  shellHook = ''
    echo "##########################################"
    echo "##########################################"
    echo "###                                    ###"
    echo "###    Page raffley development shell    ###"
    echo "###                                    ###"
    echo "##########################################"
    echo "##########################################"
  '';

  POSTGRES_USER = "postgres";
  POSTGRES_PASSWORD = "postgres";
  POSTGRES_HOST = "localhost";
  POSTGRES_DB = "raffley_dev";
}