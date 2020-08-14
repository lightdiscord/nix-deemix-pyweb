{ python3, python3Packages, deemix, fetchgit, setuptools }:

python3Packages.buildPythonApplication {
  pname = "deemix-pyweb-unstable";
  version = "2020-08-13";

  src = fetchgit {
    url = "https://codeberg.org/RemixDev/deemix-pyweb.git";
    rev = "99fd01ce938313a3907d4156d9232cb82264daf9";
    sha256 = "18ya5y4yn275dpfgi72ipp7z7dg5krqlg4qd1kd5bfm62kk8751d";
  };

  nativeBuildInputs = [setuptools];
  propagatedBuildInputs = [ deemix ] ++ (with python3Packages; [ flask flask-socketio ]);

  format = "other";

  installPhase = ''
    mkdir -p $out/{bin,${python3.sitePackages}/deemix-pyweb}
    cp -rf . $out/${python3.sitePackages}/deemix-pyweb
    chmod 555 $out/${python3.sitePackages}/deemix-pyweb/server.py
    ln -s "$out/${python3.sitePackages}/deemix-pyweb/server.py" $out/bin
  '';

  dontWrapPythonPrograms = true;

  postFixup = ''
    wrapPythonProgramsIn "$out/${python3.sitePackages}/deemix-pyweb" "$out $pythonPath"
  '';
}
