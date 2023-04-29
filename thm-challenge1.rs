use std::str;
pub(crate) use rot13::rot13;
pub(crate) use base64::{Engine as _, engine::general_purpose};

fn main() {
    const FLAG_ENCODED : &str = "M3I6r2IbMzq9";

    let flag_rot13 =  &general_purpose::STANDARD_NO_PAD.decode(rot13(FLAG_ENCODED)).unwrap();

    let s = match str::from_utf8(flag_rot13) {
        Ok(v) => v,
        Err(e) => panic!("Invalid UTF-8 sequence: {}", e),
    };

    let clear_text: String = rot13(&s);

    println!("[+] THM-Challenge1: {} (ROT13 -> base64 -> ROT13) decoded with Rust:", FLAG_ENCODED);
    println!("{}", clear_text);
}