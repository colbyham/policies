# policies

Live privacy policy and support pages for the owner's apps, served by GitHub Pages at
https://colbyham.github.io/policies/. Active: App Store and Atlassian listings link here.

## Run

There is no local build. There is no Gemfile and Jekyll is not installed here. GitHub Pages
renders the Markdown with the `minima` theme from `_config.yml` when `master` (the only
branch) is pushed (not run here: it publishes).

## Done means

```
python3 -c "import re,pathlib,sys; bad=[(str(p),l) for p in pathlib.Path('.').rglob('*.md') for l in re.findall(r'\]\(([^)#:]+)\)',p.read_text()) if not (p.parent/l/'index.md').exists() and not (p.parent/l).is_file()]; print(bad or 'links ok'); sys.exit(bool(bad))"
```

Passing prints `links ok` and exits 0 in about 0.03 s. It only checks that relative links
resolve. The policy wording is checked by hand against the app repo (see Gotchas).

## Never

- Never rename or move an app folder. The URL `/policies/<slug>/` is hard-coded in the apps
  (for example `PRIVACY_URL` in `../ramp-and-hold/src/lib/links.ts`) and in store listings.
  App Review 5.1.1 needs that link to stay live.
- Never change what a page says an app collects unless the app's code backs it up. The evidence
  for each app is its `store/privacy-label.md` (`../verse-and-chord`, `../studio-ledger`,
  `../ramp-and-hold`). A policy that disagrees with the App Store privacy label is a review risk.
- Never make the repo private or turn off Issues. Free GitHub Pages needs a public repo, and
  Verse & Chord's support contact is a prefilled issue link on this repo.
- Never make up a support email address. The owner chooses it.

## Gotchas

- Each page is the published copy of the app repo's `store/privacy.md` (in `../verse-and-chord`,
  `../studio-ledger`, `../ramp-and-hold`, `../forge-stale-page-radar`). As of 2026-11-07 the
  three app pages are byte-identical copies of their app's `store/privacy.md`; Stale Page
  Radar's page still differs from its source. Edit the source and the page together.
- The three apps share one RevenueCat setup (react-native-purchases 10.10.2, anonymous id). Each
  app's `store/privacy-label.md` holds the code evidence and the App Store answers ("Data Not
  Linked to You: Purchases"), and each policy names what the SDK sends at launch (device model,
  iOS/app version, language, App Store country, the IDFV). Change a policy, its label file and
  `store/listing.md` together, whenever a dependency or network call changes.
- Three pages still contain the literal placeholder `SUPPORT_EMAIL` (`grep -rn SUPPORT_EMAIL .`).
- GitHub Pages publishes every `.md` file. `_config.yml` excludes this one (`exclude:
  - CLAUDE.md`); keep that line, or the file goes live at `/policies/CLAUDE.html`.
- Every push to `master` is live right away. Bump a page's "Effective date" when you change what it
  says. The Verse & Chord policy promises to do this.
