{lib,stdenv,fetchurl,skkDictionaries,patchelf}:
stdenv.mkDerivation rec {
  name = "yaskkserv2";
  version = "0.1.7";
  src = fetchurl {
    url = "https://github.com/wachikun/yaskkserv2/releases/download/${version}/yaskkserv2-${version}-x86_64-unknown-linux-gnu.tar.gz";
    sha256="db73a9b1e924c9496399b483f2975a394f06aa9c175c817b01fe50aeba6a634e";
  };
nativeBuildInputs = [ patchelf ];
  unpackPhase = ''
    tar xf $src
  '';
  sourceRoot="yaskkserv2-${version}-x86_64-unknown-linux-gnu";
  installPhase = ''
    mkdir -p $out/bin
    cp yaskkserv2 yaskkserv2_make_dictionary $out/bin
  patchelf \
    --set-interpreter ${stdenv.cc.bintools.dynamicLinker} \
    $out/bin/yaskkserv2_make_dictionary
    mkdir -p $out/share
    $out/bin/yaskkserv2_make_dictionary --dictionary-filename=$out/share/dictionary.yaskkserv2 ${skkDictionaries.l}/share/skk/SKK-JISYO.L ${skkDictionaries.jinmei}/share/skk/SKK-JISYO.jinmei ${skkDictionaries.fullname}/share/skk/SKK-JISYO.fullname ${skkDictionaries.geo}/share/skk/SKK-JISYO.geo ${skkDictionaries.propernoun}/share/skk/SKK-JISYO.propernoun ${skkDictionaries.station}/share/skk/SKK-JISYO.station
  '';

  meta = with lib; {
    description="Yet Another SKK server";
    platforms = platforms.linux;
    licenses = with lib.licenses; [ mit apache2 ];
  };
}
