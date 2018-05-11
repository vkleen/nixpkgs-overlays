let name = "pragmatapro-${version}";
    version = "0.826";
in self: super: {
  pragmatapro = self.runCommand name rec {
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = "1chxaanhapxxxqgs10ba2g7f8j95xb36f2496vjrk92hmvrzjllf";

    src = self.requireFile rec {
      name = "PragmataPro${version}.zip";
      url = "file://path/to/${name}";
      sha256 = "0cb4dad0452664e27c01fe6815dff7073e60d8219551718e516dab6bcdacfd64";
    };

    buildInputs = [ self.unzip ];
  } ''
    unzip $src
    install_path=$out/share/fonts/truetype/pragmatapro
    mkdir -p $install_path
    find -name "PragmataPro*.ttf" -and -not -name "*liga*" -exec cp {} $install_path \;
  '';
}
