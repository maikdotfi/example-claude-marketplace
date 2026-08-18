#!/usr/bin/env bash
# Bump the social-media plugin version in the two manifests that must agree:
# the marketplace entry and the plugin's own manifest.
#
# Usage: scripts/bump-version.sh <new-version>
set -euo pipefail

new="${1:?usage: bump-version.sh <new-version>}"
root="$(cd "$(dirname "$0")/.." && pwd)"
plugin="social-media"

NEW="$new" PLUGIN="$plugin" python3 - "$root" <<'PY'
import json, os, pathlib, sys

root = pathlib.Path(sys.argv[1])
new, name = os.environ["NEW"], os.environ["PLUGIN"]

manifest = root / "plugins" / name / ".claude-plugin" / "plugin.json"
market = root / ".claude-plugin" / "marketplace.json"

m = json.loads(manifest.read_text())
old = m["version"]
m["version"] = new
manifest.write_text(json.dumps(m, indent=2, ensure_ascii=False) + "\n")

# Only the plugin's entry — never the marketplace's own metadata.version.
mk = json.loads(market.read_text())
entry = next(p for p in mk["plugins"] if p["name"] == name)
entry["version"] = new
market.write_text(json.dumps(mk, indent=2, ensure_ascii=False) + "\n")

print(f"{name}: {old} -> {new}")
PY
