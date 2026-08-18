# example-claude-marketplace

A minimal — but complete and validated — Claude plugin marketplace, built to
exercise one specific thing: publishing a plugin update over git and watching
consumers pick it up.

It ships exactly one plugin (`social-media`) containing exactly one skill
(`social-post`), which turns source material into platform-tailored social posts.

## Layout

```
.claude-plugin/marketplace.json          # marketplace manifest (lists plugins)
plugins/social-media/
  .claude-plugin/plugin.json             # plugin manifest
  skills/social-post/
    SKILL.md                             # the skill: instructions + workflow
    references/platforms.md              # loaded only when the skill runs
scripts/bump-version.sh                  # keeps both version fields in sync
```

Worth knowing if you extend this:

- The marketplace manifest **must** live at `.claude-plugin/marketplace.json` in
  the repo root; each plugin needs its own `.claude-plugin/plugin.json`.
- Skills are auto-discovered from `<plugin>/skills/<name>/SKILL.md`. There is no
  registry to update — adding a directory is enough.
- Only the YAML frontmatter of every `SKILL.md` sits in context permanently
  (~125 tokens here). The body loads when the skill fires, and files under
  `references/` load only if the skill reads them. Put bulk there, not in
  `SKILL.md`.

## Install as a consumer

Claude Code:

```bash
claude plugin marketplace add maikdotfi/example-claude-marketplace
claude plugin install social-media@example-marketplace
```

Claude Cowork: **Settings → Capabilities → Marketplaces → Add marketplace**, and
give it `maikdotfi/example-claude-marketplace` (or the full
`https://github.com/maikdotfi/example-claude-marketplace` URL). Then install
`social-media` from the plugin list.

Local development, without going through GitHub — the `./` prefix is required
for path sources, and a local marketplace is read in place rather than copied
into `~/.claude/plugins`:

```bash
claude plugin marketplace add ./
claude plugin install social-media@example-marketplace
```

Verify:

```bash
claude plugin list                     # social-media@example-marketplace, enabled
claude plugin details social-media     # Skills (1) social-post, token cost
```

Then in a new session: *"draft a LinkedIn and Bluesky post announcing our new
caching layer — it cut cold starts by 40%."*

## Publish an update

```bash
bash scripts/bump-version.sh 0.2.0
claude plugin validate .
git commit -am "social-media 0.2.0" && git push
```

The bump script rewrites the version in both places that must agree — the
marketplace entry and the plugin manifest — and deliberately leaves the
marketplace's own `metadata.version` alone.

Optionally cut a release tag, which re-checks that the plugin manifest and the
marketplace entry agree before tagging:

```bash
claude plugin tag plugins/social-media   # creates social-media--v0.2.0
```

## Consuming the update

Marketplace metadata is cached locally, so a consumer sees the new version once
the catalog is refreshed:

```bash
claude plugin marketplace update example-marketplace
claude plugin update social-media@example-marketplace   # restart to apply
```

Note that `plugin update` needs the full `plugin@marketplace` id — the bare name
fails with "Plugin not found". Claude Code also refreshes marketplaces on its own
periodically, so an installed plugin drifts up to the newest published version
without anyone typing a command, which is the behaviour this repo exists to
demonstrate.

To watch an update land, pair a version bump with a visible behaviour change —
adding a platform to `references/platforms.md` is the easiest one, since the
skill's output changes in a way you can see. `claude plugin list` confirms which
version is actually installed.

## License

MIT
