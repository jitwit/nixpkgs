{ stdenv, fetchgit, chez }:

stdenv.mkDerivation {
  pname = "chez-hemlock";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/hemlock.git";
    rev = "a695561bd2822385ce4f04aa17ee09b1d8f9162d";
    sha256 = "1jlmcgw06l9w95z4vy0y23fcmq9ydscjz0m54dj2gq5ad5f7d1bw";
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
