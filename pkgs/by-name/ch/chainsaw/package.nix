{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "chainsaw";
  version = "2.10.1";

  src = fetchFromGitHub {
    owner = "WithSecureLabs";
    repo = "chainsaw";
    tag = "v${version}";
    hash = "sha256-ErDIfLhzCiFm3dZzr6ThjYCplfDKbALAqcu8c0gREH4=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-LTvCExHQnQIbGGeh4bK6b3r9XXOxREMTOlRQv+BjKrM=";

  buildInputs = lib.optionals stdenv.hostPlatform.isDarwin [
    darwin.apple_sdk.frameworks.CoreFoundation
  ];

  ldflags = [
    "-w"
    "-s"
  ];

  meta = with lib; {
    description = "Rapidly Search and Hunt through Windows Forensic Artefacts";
    homepage = "https://github.com/WithSecureLabs/chainsaw";
    changelog = "https://github.com/WithSecureLabs/chainsaw/releases/tag/v${version}";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ fab ];
    mainProgram = "chainsaw";
  };
}
