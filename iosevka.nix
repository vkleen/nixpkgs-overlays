self: super: {
  iosevka = (super.iosevka.override {
#    design = [ "cv01" "cv03" "cv07" "cv14" "cv17" "cv19" "cv20" "cv23" "cv24" "cv25" "cv29" "cv32" "cv35" "cv37" "cv39" "cv40" "cv42" "cv45" "cv46" "cv49" "cv51" "cv52" ];
    family = "Iosevka Custom";
    set = "Custom";
  }).overrideDerivation (old: {
    preConfigure = ''
      cat ${./iosevka/parameters.toml} >> ./parameters.toml
      ${old.preConfigure}
    '';
  });
}
