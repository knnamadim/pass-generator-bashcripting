#!/bin/bash

# Password Generator Script
# Generates passwords and optionally saves them encrypted to a file

echo "Welcome to the Password Generator!"

# Ask the user for password length
read -p "Enter the length of the password: " PASS_LENGTH

# Validate input
if ! [[ $PASS_LENGTH =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1
fi

# Ask how many passwords to generate
read -p "How many passwords do you want to generate? " PASS_COUNT
if ! [[ $PASS_COUNT =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1
fi

# Generate passwords
passwords=()
for i in $(seq 1 $PASS_COUNT); do
    passwords+=("$(openssl rand -base64 48 | cut -c1-$PASS_LENGTH)")
done

# Display generated passwords
echo -e "\nGenerated Passwords:"
printf "%s\n" "${passwords[@]}"

# Ask if user wants to save passwords
read -p "Do you want to save these passwords to a file? (y/n): " choice

if [[ "$choice" == "y" ]]; then
    read -s -p "Enter a passphrase to encrypt the file: " PASSPHRASE
    echo
    # Save passwords to a temp file
    temp_file=$(mktemp)
    printf "%s\n" "${passwords[@]}" > "$temp_file"
    # Encrypt file using ccrypt
    ccrypt -e -K "$PASSPHRASE" "$temp_file"
    mv "$temp_file.cpt" passwords.txt.cpt
    echo "Passwords saved securely to passwords.txt.cpt"
else
    echo "Passwords not saved."
fi