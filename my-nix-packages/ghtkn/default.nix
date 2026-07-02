{
  lib,
  buildGoModule,
  fetchFromGitHub,
  stdenv,
  installShellFiles,
}:
let
  version = "0.3.3";
in
buildGoModule (finalAttrs: {
  pname = "ghtkn";
  version = "${version}";

  src = fetchFromGitHub {
    owner = "suzuki-shunsuke";
    repo = "ghtkn";
    rev = "v${version}";
    hash = "sha256-Tcw/JL5U0af6Bf8b2jV5ElhCSMrhGjHfVF1ZqCXnUR4=";
  };

  nativeBuildInputs = [
    installShellFiles
  ];

  postInstall = lib.optionalString (stdenv.buildPlatform.canExecute stdenv.hostPlatform) ''
    installShellCompletion --cmd 'ghtkn' \
      --bash <("$out/bin/ghtkn" completion bash) \
      --zsh <("$out/bin/ghtkn" completion zsh) \
      --fish <("$out/bin/ghtkn" completion fish)
  '';

  vendorHash = "sha256-rsTESgnUFTRXLOyX2Q/5QQFSnoANJELITI8btISWn7o=";

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
})
