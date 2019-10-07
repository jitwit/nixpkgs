{ stdenv, fetchgit, chez, chez-hemlock }:

stdenv.mkDerivation {
  pname = "chez-sxml-mini";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/sxml-mini.git";
    rev = "5fd443bfcae25246c770c4bbbcdfe5d26b59959e";
    sha256 = "0jkq66vp45wjjdah1fpncmb8h41jjp2acv8x02fn6ys4fncln9c0";
  };

  buildInputs = [ chez ];

  buildPhase = ''
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
