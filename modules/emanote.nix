{ pkgs, inputs, ... }:
let
  emanote = inputs.emanote.outputs.defaultPackage.x86_64-linux;
in
{
  systemd.services.emanote = {
    description = "Emanote LC";
    after = [ "network.target" ];
    wantedBy = [ "default.target" ];
    environment = {
      PORT = "7000";
    };
    serviceConfig = {
      User = "lc";
      Restart = "always";
      ExecStart = "${emanote}/bin/emanote -L /home/lc/Source/gitlab.homotopic.tech/locallycompact/notes";
    };
  };
}
