.PHONY: all clean c rust python go run_c run_rust run_python run_go

.PHONY: c rust python go sh
all: c rust python go sh

c: c_true.c
	gcc -o c_true c_true.c

# Creates rust_true/target/release/rust_true
rust:
	@echo "Building Rust (release mode)..."
	cargo build --release --manifest-path=rust_true/Cargo.toml
	@echo "Rust build complete. Executable is in rust_true/target/release/"

python: python_true.py
	test -x python_true.py
	@echo "Python script ready."

go: go_true.go
	go build -o go_true go_true.go

sh: true.sh
	test -x true.sh
	@echo "Shell script ready."

run_c: c
	@echo "--- Execute true via C ---"
	./c_true
	@echo "Exit code: $$?"

run_rust: rust
	@echo "--- Execute true via Rust ---"
	rust_true/target/release/rust_true
	@echo "Exit code: $$?"

# Run Python example
run_python: python
	@echo "--- Execute true via Python3 ---"
	./python_true.py
	@echo "Exit code: $$?"

# Run Go example
run_go: go
	@echo "--- Execute true via Go ---"
	./go_true
	@echo "Exit code: $$?"

run_sh: sh
	@echo "--- Execute true via /bin/sh ---"
	./true.sh
	@echo "Exit code: $$?"

# Run all
test-all:
	./bench-exec-loop.sh all 500

# --- Clean Target ---
clean:
	@echo "Cleaning up..."
	rm -f c_true go_true
	# Clean Rust project build files
	cargo clean --manifest-path=rust_true/Cargo.toml
	@echo "Clean complete."
