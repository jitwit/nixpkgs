{ stdenv, fetchgit, chez, chez-hemlock }:

stdenv.mkDerivation {
  pname = "chez-charset";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/chez-charset.git";
    rev = "30c8de3179855b3403a03e732a5806585f2657bd";
    sha256 = "1qlm4xja1n5r8q46989kw2k8dkm4vw7zf753dlaa95lnq0xfmpih";
  };

  buildInputs = [ chez chez-hemlock ];

  buildPhase = ''
    export CHEZSCHEMELIBDIRS=${chez-hemlock}/lib/csv9.5-site/
    make prefix=$out CHEZ=${chez}/bin/scheme
  '';

  installPhase = ''
    make install prefix=$out CHEZ=${chez}/bin/scheme
  '';

  meta = {
    description = "This package contains a simple charset implementaiton using patricia trees";
    homepage = https://github.com/jitwit/chez-charset/;
    maintainers = [ stdenv.lib.maintainers.jitwit ];
    license = stdenv.lib.licenses.gpl3;
  };

}
