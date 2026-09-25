// XIOM -- test-registry-smoke package manifest (community smoke test).
//
// Note: the GitHub repository is `LefterisNotas/test_registry_smoke`, but the
// package name uses hyphens because registry names reject underscores
// (lowercase letters, digits, and hyphens, dot-separated).

package test_registry_smoke {
  name: "test-registry-smoke";
  version: "0.1.0";
  description: "Community smoke test for XIOM trusted publishing -- safe to yank";
  categories: ["tooling"];
  keywords: ["smoke", "canary", "trusted-publishing"];
  license: "MIT";
  repository: "https://github.com/LefterisNotas/test_registry_smoke";
  authors: ["The test_registry_smoke Authors"];
  modules: ["test_registry_smoke"];
  stage: "incubating";
}
