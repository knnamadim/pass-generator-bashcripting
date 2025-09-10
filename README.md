# Password Generator

A simple Bash script to generate secure passwords, validate user input, and optionally save encrypted passwords to a file.

## Features

- Generate multiple random passwords of user-specified length.
- Validate input to ensure the password length is a number.
- Optionally save generated passwords to an encrypted file using `ccrypt`.

## Prerequisites

- Bash shell (Linux, macOS, or WSL on Windows)
- `openssl` (for password generation)
- `ccrypt` (for encryption, optional if you want to save passwords)

Install prerequisites on Ubuntu/Debian:
sudo apt update
sudo apt install openssl ccrypt -y

On macOS (with Homebrew): brew install openssl ccrypt

 ## How to use:
 1. Clone the repository: git clone https://github.com/your-username/password-generator.git
    cd password-generator
2. Make the script executable: chmod +x pass-generator.sh
3. Run the script: ./pass-generator.sh
4. Follow the prompts:
- Enter the desired password length.
- Decide if you want to save the passwords to an encrypted file.
- If saving, you will need to provide a passphrase for encryption.

----
## Example Output
Welcome to password generator
Please enter the length of the password:
12
Here are the generated passwords:
Abc123!@#XyZ
Mno456$%^Pqr
...
Do you want to save these passwords to a file? (y/n)  - > y
Passwords saved securely to passwords.txt.cpt
  
