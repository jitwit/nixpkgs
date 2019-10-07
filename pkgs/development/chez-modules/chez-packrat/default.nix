{ stdenv, fetchgit, chez, chez-srfi }:

stdenv.mkDerivation {
  pname = "chez-packrat";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/chez-packrat.git";
    rev = "3ad804d6401bc9942005337f18acb93d98b77ff9";
    sha256 = "1k65nzccqw4qw48rvjbfxbv31cbwbnyxsdz0w0a1ycjq0r1b3z0q";
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
    description = "Packrat parsing library and json parser that uses it";
    homepage = https://github.com/jitwit/chez-packrat/;
    maintainers = [ stdenv.lib.maintainers.jitwit ];
    license = stdenv.lib.licenses.mit;
  };

}
