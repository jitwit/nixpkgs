{ stdenv, fetchgit, chez, chez-srfi }:

stdenv.mkDerivation {
  pname = "chez-packrat";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/chez-packrat.git";
    rev = "56bbbd03d17103b43f3166cccf9649b66001981f";
    sha256 = "0ljlv0hiyzvj9xjr05czsmj3cjp50p03z1b38z26hlbl7kl29s7r";
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
