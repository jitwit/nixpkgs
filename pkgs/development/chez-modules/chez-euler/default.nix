{ stdenv, fetchgit, chez, chez-hemlock }:

stdenv.mkDerivation {
  pname = "chez-euler";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/chez-euler.git";
    rev = "9a142fb35d9422f3d2a1a51e330eff22c09c069f";
    sha256 = "0cxramapnrmb0kj8lngajbs9dvd5h6jamnic0gmv9sixl9vsxzvv";
  };

  buildInputs = [ chez chez-hemlock ];

  buildPhase = ''
    export CHEZSCHEMELIBDIRS=${chez-hemlock}/lib/csv9.5-site/
    make prefix=$out chez=${chez}/bin/scheme
  '';

  installPhase = ''
    make install prefix=$out chez=${chez}/bin/scheme
  '';

  meta = {
    description = "Various numerical procedures written while solving project euler problems";
    homepage = https://github.com/jitwit/chez-euler/;
    maintainers = [ stdenv.lib.maintainers.jitwit ];
    license = stdenv.lib.licenses.gpl3;
  };

}
