{ stdenv, fetchgit, chez }:

stdenv.mkDerivation {
  pname = "chez-hemlock";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/chez-hemlock.git";
    rev = "ae37dbff2794cd7a5a311cde303c8a1ab70817f2";
    sha256 = "06qmr0czkkp14fhs2g2j03yb1xjwlkhm2n6yx0w77xdn6m6ip5nh";
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
