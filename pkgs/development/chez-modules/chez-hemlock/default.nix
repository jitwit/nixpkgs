{ stdenv, fetchgit, chez }:

stdenv.mkDerivation {
  pname = "chez-hemlock";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/hemlock.git";
    rev = "9ec3a7a388faac28d1ddd170924540d0903a5e6f";
    sha256 = "0284hcnkgcqsrwj0cp0ykpi2xxpgf8sil16qhpp5x47d5xclsbvg";
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
