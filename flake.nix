{
  description = "Development shell for the Raffley project";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [ 
        beamMinimal27Packages.erlang
        beamMinimal27Packages.elixir_1_19
          beamMinimal27Packages.elixir-ls

        nodejs
        esbuild
        tailwindcss_4

        docker
        docker-compose

        flyctl
      ];

      env = {
        POSTGRES_USER = "postgres";
        POSTGRES_PASSWORD = "postgres";
        POSTGRES_HOST = "localhost";
        POSTGRES_DB = "raffley_db_dev";
        POSTGRES_PORT = "5432";
        TAILWINDCSS_PATH="${pkgs.lib.getExe pkgs.tailwindcss_4}";
        TAILWINDCSS_VERSION="4.3.3";
        ESBUILD_PATH="${pkgs.lib.getExe pkgs.esbuild}";
        ESBUILD_VERSION="0.25.5";
        COMPOSE_FILE="local-development-docker-compose.yml";
      };

      shellHook = ''
        echo "################################################"
        echo "################################################"
        echo "###                                          ###"
        echo "###        Raffley development shell         ###"
        echo "###                                          ###"
        echo "################################################"
        echo "################################################"
      '';
    };
  };
}
