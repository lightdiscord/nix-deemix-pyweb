{ python3Packages, spotipy }:

python3Packages.buildPythonPackage rec {
  pname = "deemix";
  version = "1.1.31";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1rakds2qm17b4b270y5h0fa4i629179zwh13f9hjvplcnvr84093";
  };

  propagatedBuildInputs = (with python3Packages; [ mutagen pycryptodomex click requests ]) ++ [ spotipy ];

  doCheck = false;
}
