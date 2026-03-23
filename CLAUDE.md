# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Helm chart repository published to GitHub Pages at `https://maximemoreillon.github.io/helm-repository/` and indexed on Artifact Hub. Charts are automatically released via GitHub Actions on push to `master`.

## Common Commands

```bash
# Add required Helm repos (needed before updating dependencies)
helm repo add moreillon https://maximemoreillon.github.io/helm-repository/
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add neo4j-helm-charts https://helm.neo4j.com/neo4j
helm repo add neo4j https://helm.neo4j.com/neo4j
helm repo add kong https://charts.konghq.com
helm repo add influxdata https://helm.influxdata.com/
helm repo update

# Update chart dependencies
helm dependency update charts/<chart-name>

# Lint a chart
helm lint charts/<chart-name>

# Template/dry-run a chart
helm template my-release charts/<chart-name>
helm template my-release charts/<chart-name> -f my-values.yaml

# Install/upgrade a chart locally
helm upgrade --install my-release charts/<chart-name>
```

## Release Process

Releases are fully automated: pushing to `master` triggers `.github/workflows/release.yml`, which uses `helm/chart-releaser-action` to package and publish any charts with updated versions to GitHub Pages.

To release a new chart version: bump `version` in `Chart.yaml`, commit, and push to `master`.

## Architecture

### Chart Structure

All charts follow the same pattern:
- `Chart.yaml` — metadata, version, appVersion, and dependency declarations
- `values.yaml` — default values (image tag, Kong config, DB config, env vars)
- `templates/` — Kubernetes manifests
- `charts/` — downloaded subchart dependencies (committed)

### Dependency Stack

Most charts compose several layers:

1. **Kong API Gateway** (version ~2.39.2, from `kong` repo) — used in nearly all charts, always in db-less mode (`database: "off"`), exposed via `NodePort`
2. **MongoDB** (Bitnami, ~13.x) or **Neo4j** (~5.20.0) — for persistent storage
3. **Internal charts** — some charts depend on other charts in this repo:
   - `camera-viewer`, `face-recognition`, `food-manager`, `mosquitto-user-manager` depend on `user-manager-mongodb`
   - `user-manager-neo4j` depends on `group-manager`

### Multi-Component Charts

Complex charts (e.g., `user-manager-mongodb`, `user-manager-neo4j`, `face-recognition`) have separate template subdirectories per component:
- `templates/api/` — backend API deployment + service
- `templates/gui/` — frontend deployment + service
- `templates/kong/` — Kong ConfigMap with db-less routing config

### Configuration Patterns

**Image**: All images follow `moreillon/<service-name>`, with `tag` defaulting to `""` (uses `Chart.appVersion`).

**Environment variables**: Injected via `env: []` (list of `name`/`value` pairs) and `envFrom: []` (ConfigMap/Secret references) in `values.yaml`.

**Kong**: Configured db-less with a `kong-config` ConfigMap. Proxy exposed on a chart-specific `NodePort` (typically in the 31081–31082 range).

**MongoDB auth**: Disabled by default (`auth.enabled: false`).

### Naming Conventions

- Chart versions follow semver; `appVersion` tracks the upstream Docker image tag
- Helper templates in `_helpers.tpl` (and sometimes `_mongodb_helpers.tpl`, `_ingress_helpers.tpl`, `_name_helpers.tpl` for complex charts)
- Prettierrc enforces `bracketSpacing: false` for JSON/YAML formatting
