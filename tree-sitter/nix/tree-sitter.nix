{ mkDerivation, base, bytestring, containers, directory, filepath
, hedgehog, lib, split, template-haskell, unordered-containers
}:
mkDerivation {
  pname = "tree-sitter";
  version = "0.9.0.3";
  src = ../.;
  libraryHaskellDepends = [
    base bytestring containers directory filepath split
    template-haskell unordered-containers
  ];
  testHaskellDepends = [ base hedgehog ];
  homepage = "http://github.com/tree-sitter/haskell-tree-sitter#readme";
  description = "Unstable bindings for the tree-sitter parsing library";
  license = lib.licenses.bsd3;
}
