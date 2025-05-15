use std::process::{Command, exit};

fn main() {
    let mut command = Command::new("true");

    let status = command.status().unwrap_or_else(|e| {
        eprintln!("Failed to execute 'true': {}", e);
        exit(1);
    });

    match status.code() {
        Some(code) => {
            exit(code);
        }
        None => {
            eprintln!("Process terminated by signal");
            exit(1);
        }
    }
}
