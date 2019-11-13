{ stdenv, fetchgit, chez, chez-hemlock, chez-charset }:

stdenv.mkDerivation {
  pname = "chez-brzozowski";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/chez-brzozowski.git";
    rev = "ace9113dc857979a60ff296d3b0ff31900d128b8";
    sha256 = "0ikkq1w62fx12lsgnw3fd5smwghsgq8xxbc83sbwnvamzcadm0gs";
  };

  buildInputs = [ chez chez-hemlock chez-charset ];

  buildPhase = ''
    export CHEZSCHEMELIBDIRS=${chez-hemlock}/lib/csv9.5-site/:${chez-charset}/lib/csv9.5-site/
    make prefix=$out CHEZ=${chez}/bin/scheme
  '';

  installPhase = ''
    make install prefix=$out CHEZ=${chez}/bin/scheme
  '';

  meta = {
    description = "Parsing with derivatives";
    homepage = https://github.com/jitwit/chez-brzozowski/;
    maintainers = [ stdenv.lib.maintainers.jitwit ];
    license = stdenv.lib.licenses.gpl3;
  };

}
