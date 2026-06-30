{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
let
  version = "0.3.1";
in
buildGoModule {
  pname = "ghtkn";
  version = "v${version}";
  src = fetchFromGitHub {
    owner = "suzuki-shunsuke";
    repo = "ghtkn";
    rev = "v${version}";
    hash = "sha256-kqJHnG7JDNfsnx2L/RaN6f+U+LW8q6y/6+Wy+nWoPPo=";
  };

  vendorHash = "sha256-MvziGBc12YacYZ3zBxQY7l/WdBe7FvR0d4im6rzlFXI=";

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
