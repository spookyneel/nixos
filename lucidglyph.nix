{
  pkgs,
  inputs,
  ...
}: let
  lucidglyphConf = pkgs.runCommand "lucidglyph-fontconfig" {} ''
    mkdir -p $out/etc/fonts/conf.d
    for f in ${inputs.lucidglyph}/src/modules/fontconfig/*.conf; do
      ln -s "$f" $out/etc/fonts/conf.d/$(basename "$f")
    done
  '';
in {
  fonts = {
    packages = with pkgs; [
      inter
      geist-font
      jetbrains-mono
      iosevka
      noto-fonts
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
    ];

    fontconfig = {
      enable = true;
      confPackages = [lucidglyphConf];
    };
  };

  environment.variables = {
    FREETYPE_PROPERTIES = "autofitter:no-stem-darkening=0 autofitter:darkening-parameters=500,500,1000,500,2500,500,4000,0 cff:no-stem-darkening=0 type1:no-stem-darkening=0 t1cid:no-stem-darkening=0";
    QT_NO_SYNTHESIZED_BOLD = "1";
  };
}
