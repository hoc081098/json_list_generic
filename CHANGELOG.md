## [Unreleased]

### Changed
- Updated Dart SDK constraint to `^3.8.0` to support the latest Dart features
- Updated dependencies to latest versions:
  - `json_annotation` to `^4.9.0`
  - `json_serializable` to `^6.11.0`
  - `analyzer` to `^9.0.0`
  - `test` to `^1.28.0`
  - `build_runner` to `^2.10.0`
- Replaced deprecated `pedantic` package with `lints` (`^5.0.0`)
- Updated `analysis_options.yaml` to use `package:lints/recommended.yaml`
- Added language version comments (`// @dart=3.8`) to all Dart source files

### Added
- Added comprehensive tests for `PaginationResult` serialization and deserialization
