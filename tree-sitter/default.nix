{ compiler ? "ghc901" }:
let
  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = new: old: rec {
          tree-sitter = with pkgs.haskell.lib; (new.callPackage ./nix/tree-sitter.nix {});
        };
      };

    };
  };

  pkgs = import (fetchGit (import ./version.nix)) { inherit config; };

  shell = pkgs.mkShell {
    buildInputs = with pkgs.haskellPackages; [
      cabal-install
      haskell-language-server
      hspec-discover
      cabal2nix
      pkgs.gcc
    ];
    inputsFrom = [ pkgs.haskellPackages.tree-sitter.env ];
  };

in {
  tree-sitter = pkgs.haskellPackages.tree-sitter;
  shell = shell;
}
