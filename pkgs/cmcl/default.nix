{ stdenv 
, makeWrapper
, jre
}:

stdenv.mkDerivation rec {
  name = "cmcl-${version}";
  version = "2.1.3";
  src = fetchurl {
    url = "https://gitee.com/MrShiehX/console-minecraft-launcher/releases/download/${version}/cmcl.jar";
  };
  
  buildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    cp ${src} $out/bin
    makeWrapper ${jre}/bin/java $out/bin/bilibili \
      --argv0 "cmcl" --add-flags "--jar" --add-flags "$out/bin/cmcl.jar" 
  '';
}
