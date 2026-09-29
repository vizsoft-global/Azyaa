# Azyaa

The Azyaa customer app (Flutter, exported from FlutterFlow). FlutterFlow is no
longer regenerating this code, so edits here are kept by hand.

## Setup

```bash
flutter pub get
```

Copy `assets/environment_values/environment.json` and fill in the environment
values if you are running against a different Firebase project.

## Run and build

```bash
flutter run -d chrome          # web
flutter build web --profile    # profile build
flutter analyze --no-pub       # static checks
flutter test                   # perf guard tests
```

Serve a built web build locally:

```bash
python3 -m http.server 8099 --directory build/web
```

## Notes

- The app loads Firebase config and third-party keys from
  `assets/environment_values/environment.json`.
- Performance guards in `test/perf_guards_test.dart` fail if uncached
  `Image.network` calls or eager `shrinkWrap` lists increase. Treat them as a
  ratchet: counts may only go down.
