{ stdenv, fetchgit, chez, chez-hemlock, chez-srfi, chez-euler, chez-matchable }:

stdenv.mkDerivation rec {
  pname = "chez-cobble";
  version = "0.1";
  src = fetchgit {
    url = "https://github.com/jitwit/cobble.git";
    rev = "4b144e11c7e81dcc0c3a5e43ffd72f5e6bf12778";
    sha256 = "1h8jvkra9ndh310qgjsh7n3k28ain9rl4z2v69ljsi910djrbm45";
  };

  buildInputs = [ chez chez-hemlock chez-euler chez-srfi chez-matchable ];

  libdirs = "${chez-hemlock}/lib/csv-site/:${chez-euler}/lib/csv-site/:${chez-srfi}/lib/csv-site/:${chez-matchable}/lib/csv-site/";
  libpath = "$out/lib/csv-site/:${libdirs}";

  buildPhase = ''
    export CHEZSCHEMELIBDIRS=${libdirs}
    make build
  '';

  installPhase = ''
    mkdir -p $out/lib/csv-site/
    mkdir -p $out/bin/
    cp gobble.so $out/lib/csv-site/
    cp gobbler.so $out/bin/
    echo "${chez}/bin/scheme --libdirs ${libpath} -q --program $out/bin/gobbler.so \$@" >> $out/bin/gobbler
    chmod 755 $out/bin/gobbler
  '';

  meta = {
    description = "This package solves and generates boggle boards";
    homepage = https://github.com/jitwit/cobble/;
    maintainers = [ stdenv.lib.maintainers.jitwit ];
    license = stdenv.lib.licenses.gpl3;
  };

}
