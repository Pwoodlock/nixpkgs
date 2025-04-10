{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "url-parser";
  version = "2.1.4";

  src = fetchFromGitHub {
    owner = "thegeeklab";
    repo = "url-parser";
    tag = "v${version}";
    hash = "sha256-GIJj4t6xDXfXMWfSpUR1iI1Ju/W/2REedgtyEFgbylE=";
  };

  vendorHash = "sha256-gYkuSBgkDdAaJArsvTyZXkvYCKXkhic5XzLqPbbGVOw=";

  ldflags = [
    "-s"
    "-w"
    "-X"
    "main.BuildVersion=${version}"
    "-X"
    "main.BuildDate=1970-01-01"
  ];

  meta = with lib; {
    description = "Simple command-line URL parser";
    homepage = "https://github.com/thegeeklab/url-parser";
    changelog = "https://github.com/thegeeklab/url-parser/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ doronbehar ];
    mainProgram = "url-parser";
  };
}
