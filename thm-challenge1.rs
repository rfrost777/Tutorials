/***********************************************************
 *  TryHackMe Rust Room, Challenge 1:
 *  chain decode a given string ROT13 -> base64 -> ROT13
 *  using rust_lang.
 */
use std::str;
pub(crate) use rot13::rot13;
pub(crate) use base64::{Engine as _, engine::general_purpose};

fn main() {
    // The encoded flag as given in the challange task:
    const FLAG_ENCODED : &str = "M3I6r2IbMzq9";

    // Start by ROT13 encode our flag, then base64 decode the result:
    let flag_rot13 =  &general_purpose::STANDARD_NO_PAD.decode(rot13(FLAG_ENCODED)).unwrap();

    // Convert the &Vec<u8> to &str we need to feed into another round of ROT13:
    let s = match str::from_utf8(flag_rot13) {
        Ok(v) => v,
        Err(e) => panic!("Invalid UTF-8 sequence: {}", e),
    };

    // there we go, another ROT13...
    let clear_text: String = rot13(&s);

    // ... and we should be done. Output the result:
    println!("[+] THM-Challenge1: {} (ROT13 -> base64 -> ROT13) decoded with Rust:", FLAG_ENCODED);
    println!("{}", clear_text);
}