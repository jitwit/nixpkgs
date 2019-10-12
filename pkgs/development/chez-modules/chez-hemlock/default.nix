{ stdenv, fetchgit, chez }:

stdenv.mkDerivation {
  pname = "chez-hemlock";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/chez-hemlock.git";
    rev = "6087eb4267a859d823d1daf2c0635b4803e1e286";
    sha256 = "1dnr6z1igmzkxszpcmpwx1qnksbz3hdyrhmlw316z24dbm0xibyq";
  };

  buildInputs = [ chez ];

  buildPhase = ''
    make prefix=$out CHEZ=${chez}/bin/scheme
  '';

  installPhase = ''
    make install prefix=$out CHEZ=${chez}/bin/scheme
  '';

  meta = {
    description = "This package contains implementations of tree structures and others";
    homepage = https://github.com/jitwit/chez-hemlock/;
    maintainers = [ stdenv.lib.maintainers.jitwit ];
    license = stdenv.lib.licenses.gpl3;
  };

}
