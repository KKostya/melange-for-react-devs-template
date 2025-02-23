{
  inputs = {
    opam-nix.url = "github:tweag/opam-nix";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.follows = "opam-nix/nixpkgs";
  };
  outputs = { self, flake-utils, opam-nix, nixpkgs }@inputs:
    let 
      package = "melange-for-react-devs";
      opamdeps = { 
        ocaml-base-compiler = "5.2.0";
        ocaml-lsp-server = "*";
        utop = "*";
        merlin = "*"; 
      };
    in flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        opamnix = opam-nix.lib.${system};
        scope = opamnix.buildOpamProject { } package ./. opamdeps;
        overlay = final: prev: {
          melange = (import ./melange-overlay.nix) pkgs prev;
        };
      in {
        inherit scope;
        legacyPackages = scope.overrideScope overlay;
        packages.default = self.legacyPackages.${system}.${package};
        devShells.default = pkgs.mkShell {
          inputsFrom = [
            self.legacyPackages.${system}.${package}
          ];
          packages = [
            pkgs.git
            pkgs.nodejs_18
            self.legacyPackages.${system}.ocaml-lsp-server
            self.legacyPackages.${system}.utop
          ];
        };
      }
    );
}
