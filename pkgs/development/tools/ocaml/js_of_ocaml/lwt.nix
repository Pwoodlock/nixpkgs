{
  buildDunePackage,
  js_of_ocaml-ppx,
  js_of_ocaml,
  lwt,
  lwt_log,
}:

buildDunePackage {
  pname = "js_of_ocaml-lwt";

  inherit (js_of_ocaml) version src meta;

  buildInputs = [ js_of_ocaml-ppx ];

  propagatedBuildInputs = [
    js_of_ocaml
    lwt
    lwt_log
  ];
}
