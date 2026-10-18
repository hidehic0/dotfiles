{
  lib,
  buildGo127Module,
  fetchFromGitHub,
  stdenv,
  installShellFiles,
}:
let
  version = "0.4.1";
in
buildGo127Module (finalAttrs: {
  pname = "ghtkn";
  version = "${version}";

  src = fetchFromGitHub {
    owner = "suzuki-shunsuke";
    repo = "ghtkn";
    rev = "v${version}";
    hash = "sha256-EtILxa6d6kmsd/6DykGqfokc3rrsXzf7ciettCkgo5E=";
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

  vendorHash = "sha256-oA9US4CoGZrkhyVCiDooV5PkTV9akDUtcSqguc+4sEk=";

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
