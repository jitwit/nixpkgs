{ stdenv, fetchgit, chez, chez-hemlock, chez-charset }:

stdenv.mkDerivation {
  pname = "chez-brzozowski";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/chez-brzozowski.git";
    rev = "cfdac74c15209a6db262cb1f667a36084d706992";
    sha256 = "14gmm7fl20093r8v7mwiqm4vss9x14k92v1sdy4lmny1mrah5vbw";
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
