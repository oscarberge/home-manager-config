{ pkgs, system, voxtype, ... }:

let
  voxtypeWithGtkOsd = pkgs.symlinkJoin {
    name = "voxtype-with-gtk4-osd";
    paths = [ voxtype.packages.${system}.vulkan ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram "$out/bin/voxtype" \
        --prefix PATH : "${voxtype.packages.${system}.osd-gtk4}/bin"
    '';
  };
in
{
  programs.voxtype.package = voxtypeWithGtkOsd;
}
