#!/usr/bin/env bash
# The repo's "Done means" check (see CLAUDE.md). Run by the claude-stop-check Stop hook.
set -euo pipefail
cd "$(dirname "$0")/.."
python3 -c "import re,pathlib,sys; bad=[(str(p),l) for p in pathlib.Path('.').rglob('*.md') for l in re.findall(r'\]\(([^)#:]+)\)',p.read_text()) if not (p.parent/l/'index.md').exists() and not (p.parent/l).is_file()]; print(bad or 'links ok'); sys.exit(bool(bad))"
