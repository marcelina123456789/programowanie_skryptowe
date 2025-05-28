def xor_encrypt(data, key):
    return bytes([b ^ key[i % len(key)] for i, b in enumerate(data)])

def encrypt_file(input_file, output_file, key_str):
    key = key_str.encode('utf-8')
    with open(input_file, 'rb') as f:
        plaintext = f.read()

    ciphertext = xor_encrypt(plaintext, key)

    with open(output_file, 'wb') as f:
        f.write(ciphertext)

if __name__ == '__main__':
    key = "tajnehaslo"  # Klucz szyfrujący
    encrypt_file("dmc.txt", "encrypted.txt", key)
    print("Plik został zaszyfrowany.")
    encrypt_file("encrypted.txt", "decrypted.txt", key)

