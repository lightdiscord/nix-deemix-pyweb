self: super:

{
  spotipy = super.python3Packages.spotipy.overrideAttrs (_: {
    doInstallCheck = false;
  });

  deemix = self.callPackage ./deemix.nix { };
  deemix-pyweb = self.python3Packages.callPackage ./deemix-pyweb.nix { };
}
