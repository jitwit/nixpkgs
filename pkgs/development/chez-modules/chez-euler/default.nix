{ stdenv, fetchgit, chez, chez-hemlock }:

stdenv.mkDerivation {
  pname = "chez-euler";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/jitwit/chez-euler.git";
    rev = "fee8844e5d48e8e4ce6e4ec7d622532d1a5d60ed";
    sha256 = "1fwa0h6n3kfqhidg4iakarqhkxin6rqbmvdpm9i38jcp22qdyriy";
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
