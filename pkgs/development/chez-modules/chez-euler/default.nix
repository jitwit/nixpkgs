{ stdenv, fetchgit, chez, chez-hemlock }:

stdenv.mkDerivation {
  pname = "chez-euler";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/chez-euler.git";
    rev = "38803c7f87cb49cdc085b978fd7e133fd66f6ce6";
    sha256 = "158b8fc75czmrfgfgqvsrh2lydlvpvy8zx1ndx2awlildn2h7k69";
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
