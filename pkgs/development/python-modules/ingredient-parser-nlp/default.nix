{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  setuptools,

  nltk,
  numpy,
  pint,
  python-crfsuite,

  pytestCheckHook,
  nltk-data,
}:
buildPythonPackage rec {
  pname = "ingredient-parser-nlp";
  version = "2.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "strangetom";
    repo = "ingredient-parser";
    tag = version;
    hash = "sha256-rmCM3KmsCGrKX5AvfIinkL689+miXII9meGAYQxSqEk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    nltk
    numpy
    pint
    python-crfsuite
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "ingredient_parser"
  ];

  # Needed for tests
  preCheck = ''
    export NLTK_DATA=${nltk-data.averaged-perceptron-tagger-eng}
  '';

  meta = {
    description = "Parse structured information from recipe ingredient sentences";
    license = lib.licenses.mit;
    homepage = "https://github.com/strangetom/ingredient-parser/";
    changelog = "https://github.com/strangetom/ingredient-parser/releases/tag/${src.tag}";
    maintainers = with lib.maintainers; [ antonmosich ];
  };
}
