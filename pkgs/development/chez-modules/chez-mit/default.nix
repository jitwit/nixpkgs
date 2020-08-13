{ stdenv, fetchgit, chez, chez-srfi }:

stdenv.mkDerivation {
  pname = "chez-mit";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/chez-mit.git";
    rev = "921ff50d770ff633cbbe846de38934c94db13500";
    sha256 = "1fivd4iwya3w36yzjz6mc7j75xcqaj5fajcq8ja48dfkjc2ldf5y";
  };

  buildInputs = [ chez chez-srfi ];

  buildPhase = ''
    export CHEZSCHEMELIBDIRS=${chez-srfi}/lib/csv9.5-site
    make PREFIX=$out CHEZ=${chez}/bin/scheme
  '';

  installPhase = ''
    make install PREFIX=$out CHEZ=${chez}/bin/scheme
  '';

  meta = {
    description = "This is a MIT/GNU Scheme compatibility library for Chez Scheme";
    homepage = "https://github.com/fedeinthemix/chez-mit/";
    maintainers = [ stdenv.lib.maintainers.jitwit ];
    license = stdenv.lib.licenses.free;
  };

}
