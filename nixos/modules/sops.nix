{ ... }:
{
  sops = {
    age.keyFile = "/var/lib/sops-nix/key.txt";
    age.generateKey = true;
    defaultSopsFile = ../../secrets/default.yaml;
    defaultSopsFormat = "yaml";
  };
}
