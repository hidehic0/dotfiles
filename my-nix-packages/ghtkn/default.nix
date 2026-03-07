{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
let
  version = "0.2.4";
in
buildGoModule {
  pname = "ghtkn";
  version = "v${version}";
  src = fetchFromGitHub {
    owner = "suzuki-shunsuke";
    repo = "ghtkn";
    rev = "v${version}";
    hash = "sha256-Du8hf4twpWtAPe81SR+xO03a52YWj+AJFI2E/gReptw=";
  };

  vendorHash = "sha256-3teRNjOOQQEJzAkXhoiV9VpYQ4EdAMBIwAyVgkMzJCY=";

  ldflags = [
    "-X main.Version=v${version}"
    "-X main.Commit=v${version}"
  ];
  env.CGO_ENABLED = 0;

  meta = {
    description = "A CLI to create short-lived (8 hours) GitHub App User Access Token for secure local development";
    homepage = "https://github.com/suzuki-shunsuke/ghtkn";
    license = lib.licenses.mit;
  };
}
