from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import padding, rsa
from cryptography.hazmat.backends import default_backend

# 1. Generowanie pary kluczy (lub wczytaj z pliku)
private_key = rsa.generate_private_key(
    public_exponent=65537,
    key_size=2048,
    backend=default_backend()
)

public_key = private_key.public_key()

# 2. Wczytaj plik do podpisania
file_path = "dmc.txt"
with open(file_path, "rb") as f:
    file_data = f.read()

# 3. Wygeneruj podpis
signature = private_key.sign(
    file_data,
    padding.PSS(
        mgf=padding.MGF1(hashes.SHA256()),
        salt_length=padding.PSS.MAX_LENGTH
    ),
    hashes.SHA256()
)

# 4. Zapisz podpis do pliku
with open("podpis.bin", "wb") as sig_file:
    sig_file.write(signature)

# 5. Zapisz klucz publiczny do pliku
with open("public_key.pem", "wb") as pub_file:
    pub_file.write(public_key.public_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PublicFormat.SubjectPublicKeyInfo
    ))

print("Podpis został wygenerowany i zapisany jako 'podpis.bin'")
