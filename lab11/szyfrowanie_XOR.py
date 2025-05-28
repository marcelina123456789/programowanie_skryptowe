# Fubrykacja szyfrująca XOR
def xor_encrypt(data, key):
    return bytes([b ^ key[i % len(key)] for i, b in enumerate(data)])

# Funkcja szyfrująca plik
def encrypt_file(input_file, output_file, key_str):
    # Konwersja klucza do bajtów
    key = key_str.encode('utf-8')
    with open(input_file, 'rb') as f:
        plaintext = f.read()

    # Szyfrowanie danych
    ciphertext = xor_encrypt(plaintext, key)

    # Zapis zaszyfrowanych danych do pliku
    with open(output_file, 'wb') as f:
        f.write(ciphertext)

if __name__ == '__main__':
    key = "tajnehaslo"  # Klucz szyfrujący
    # szyfrowanie pliku
    encrypt_file("dmc.txt", "encrypted.txt", key)
    print("Plik został zaszyfrowany.")
    # odszyfrowanie pliku (dla sprawdzenia)
    encrypt_file("encrypted.txt", "decrypted.txt", key)

