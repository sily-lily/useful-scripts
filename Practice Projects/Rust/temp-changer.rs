use std::io;

fn convert_to_c(f: f64) -> f64 {
    return f64::round((f - 32.0) / 1.8);
}

fn convert_to_f(c: f64) -> f64 {
    return f64::round((c * 1.8) + 32.0);
}

fn main() {
    println!("\nProvide a float value and C/F afterwards for conversion. (Ex: 32.0 F, 16.0 C)\n");

    let mut input: String = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Failed to read input :^(");

    let parts: Vec<&str> = input.split_whitespace().collect();
    let length: usize = parts.len();

    if length >= 2 {
        let old_temperature: f64 = parts[0].parse().unwrap();
        let format: String = parts[1].to_string().to_lowercase();

        if format == "c" {
            println!("Converted to F: {}\n", convert_to_f(old_temperature).to_string());
        } else if format == "f" {
            println!("Converted to C: {}\n", convert_to_c(old_temperature).to_string());
        }
    } else {
        println!("Invalid format! Use format: <f64> <format> (Ex: 32.0 F, 16.0 C)\n");
    }
}
