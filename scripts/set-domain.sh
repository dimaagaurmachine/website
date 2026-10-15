#!/bin/sh
# Points every absolute URL on the site (canonical, Open Graph, JSON-LD,
# sitemap, robots, llms.txt) at a new address. Run once after the custom
# domain is live on Firebase, from the repo root:
#
#   sh scripts/set-domain.sh https://www.example.in
#
# No trailing slash. Safe to re-run with another domain later.
set -e
NEW="${1%/}"
case "$NEW" in https://*) ;; *) echo "usage: sh scripts/set-domain.sh https://your-domain"; exit 1 ;; esac
cd "$(dirname "$0")/.."
OLD_FILE=scripts/.current-domain
OLD="$(cat "$OLD_FILE" 2>/dev/null || echo 'https://dimaagaurmachine.github.io/website')"
OLD_HOST="${OLD#https://}"; NEW_HOST="${NEW#https://}"
for f in index.html program-brief.html privacy-policy.html sitemap.xml robots.txt llms.txt; do
    OLD="$OLD" NEW="$NEW" OLD_HOST="$OLD_HOST" NEW_HOST="$NEW_HOST" \
    perl -pi -e 's/\Q$ENV{OLD}\E/$ENV{NEW}/g; s/\Q$ENV{OLD_HOST}\E/$ENV{NEW_HOST}/g' "$f"
done
echo "$NEW" > "$OLD_FILE"
echo "Site URLs now point at $NEW/"
grep -c "$NEW" index.html | xargs echo "  index.html references:"
