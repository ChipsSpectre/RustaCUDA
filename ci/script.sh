set -ex

if [ "$DOCS" = "yes" ]; then
    cargo clean
    cargo doc --all --no-deps
    travis-cargo doc-upload || true
elif [ "$RUSTFMT" = "yes" ]; then
    cargo fmt --all -- --check
elif [ "$CLIPPY" = "yes" ]; then
      cargo clippy --all -- -D warnings
else
    cargo build
    cargo build --tests
    cargo build --examples
fi