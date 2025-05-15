#!/bin/bash

# bench-exec-loop.sh <language|all> <count>
# <language>: c, rust, python, go, sh
# <all>: Run all languages
# <count>: Number of times to run each program

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <language|all> <count>"
    echo "  <language>: c, rust, python, go, sh"
    echo "  <all>: Run all languages"
    echo "  <count>: Number of times to run each program"
    exit 1
fi

language_or_all="$1"
count="$2"

if ! [[ "$count" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Count must be a positive integer."
    exit 1
fi

languages=()
case "$language_or_all" in
    c|rust|python|go|sh)
        languages+=("$language_or_all")
        ;;
    all)
        languages=("sh" "c" "rust" "go" "python")
        ;;
    *)
        echo "Error: Invalid language or option specified. Use c, rust, python, go, sh, or all."
        exit 1
        ;;
esac

echo "Starting performance tests for $language_or_all with $count iterations each."
echo "--------------------------------------------------"

for lang in "${languages[@]}"; do
    echo "Testing '$lang'..."

    executable=""
    case "$lang" in
        c)
            executable="./c_true"
            ;;
        rust)
            executable="./rust_true/target/release/rust_true"
            ;;
        python)
            executable="./python_true.py"
            ;;
        go)
            executable="./go_true"
            ;;
        sh)
            executable="./true.sh"
            ;;
    esac

    if [ ! -f "$executable" ]; then
        echo "  Error: Executable not found for language '$lang'."
        echo "  Please ensure you have built the '$lang' example using 'make $lang'."
        echo "--------------------------------------------------"
        continue # Skip to the next language
    fi

    start_time=$(date +%s.%N)
    for ((i=1; i<=count; i++)); do
        $executable
    done
    end_time=$(date +%s.%N)

    duration=$(echo "$end_time - $start_time" | bc -l) # -l enables math library, including floating point

    printf "  Finished '%s' %d times in %.4f seconds.\n" "$lang" "$count" "$duration"
    echo "--------------------------------------------------"

done # End of languages loop

echo "Performance tests complete."

exit 0
