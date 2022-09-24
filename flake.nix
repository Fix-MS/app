{
  description = "frontend fixms";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/master";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          defaultPackage =
            with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "fixms frontend";
        src = ./.;
        buildPhase = ''
          docker build .
        '';
        buildInputs = [
            flutter docker
        ];
        shellHook = ''
        '';
        installPhase = ''
          mkdir -p $out
          mkdir $out/bin
          echo "npm run start" > $out/bin/start
          chmod +x $out/bin/start
          cp -r node_modules $out/node_modules
          cp package.json $out/
          cp -r src $out/src
          '';
      };
    });
}
