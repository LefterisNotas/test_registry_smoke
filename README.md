# test_registry_smoke

A tiny, dependency-free package used to smoke-test **community trusted
publishing** on the XIOM registry end to end. It is safe to yank; it exists
only so the whole flow can be watched on a real instance:

> request → approval → OIDC publish → badges → yank

Repository: `https://github.com/LefterisNotas/test_registry_smoke`
Package name: `test-registry-smoke` (hyphens — registry names reject underscores)

## What this package demonstrates

- **OIDC trusted publishing** from GitHub Actions with **no long-lived token**.
- The **incubating** badge on the **community** track (`stage: "incubating"`).
- This **rendered README** (headings, lists, code, tables, quotes).
- Registry metadata: categories, keywords, size, and updated columns.

## Request trusted publishing

Sign in at the registry with GitHub and submit the request form:

| Field | Value |
|---|---|
| Kind | Trusted publisher |
| Repository | `LefterisNotas/test_registry_smoke` |
| Workflow file | `publish-registry.yml` |
| Refs | `refs/heads/main` |
| Package names or namespaces | `test-registry-smoke` |

A maintainer approves it and adds the matching entry to the
trusted-publishers file. Only then will the workflow below be accepted.

## Publish

**Actions → Publish to XIOM registry (OIDC) → Run workflow**

- `registry`: keep the staging default (`https://staging.registry.xiom-lang.org`)
- `mode`: `publish`

Optional: set a repository secret `XIOM_SIGNING_KEY` (64 hex chars) to keep a
stable public key across runs. Without it, each run signs with a fresh key.

## Verify

- Package page: `https://staging.registry.xiom-lang.org/packages/test-registry-smoke`
- The listing row should show the incubator art with the community track.
- The page shows provenance (repository, workflow, ref, run URL), the README,
  and the version's signature state.

## Yank when done

Run the same workflow with `mode: yank` and `version: 0.1.0`. A maintainer
token also works from anywhere:

```sh
curl -X POST \
  -H "Authorization: Bearer $XIOM_REGISTRY_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"reason": "smoke test cleanup"}' \
  https://staging.registry.xiom-lang.org/packages/test-registry-smoke/0.1.0/yank
```

Yanked versions stay downloadable for existing lockfiles but drop out of fresh
resolution and `latest`.

## Local dry run (optional)

```sh
# from this folder, with a scoped token in XIOM_REGISTRY_TOKEN
XIOM_REGISTRY=https://staging.registry.xiom-lang.org xiom pkg publish
```

## Checklist

- [x] Manifest with name, version, license, categories, keywords, stage
- [x] Source under `src/`
- [x] README (this file)
- [x] Repository field points at `LefterisNotas/test_registry_smoke`
- [ ] Trusted-publisher request approved
- [ ] Publish run green
- [ ] Yanked after the test
