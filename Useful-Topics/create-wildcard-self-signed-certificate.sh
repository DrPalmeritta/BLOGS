#!/usr/bin/env bash

# Set variables
DOMAIN="*.localhost.direct"
BASE_DOMAIN="localhost.direct"
DAYS_VALID=365
CERT_DIR="./certs"
ROOT_CA_KEY="$CERT_DIR/rootCA.key"
ROOT_CA_CERT="$CERT_DIR/rootCA.crt"
DOMAIN_KEY="$CERT_DIR/domain.key"
DOMAIN_CSR="$CERT_DIR/domain.csr"
DOMAIN_CERT="$CERT_DIR/domain.crt"
EXT_FILE="$CERT_DIR/domain.ext"

# Create directory for certificates
mkdir -p $CERT_DIR

# Step 1: Generate Root CA
echo "Generating Root CA..."
openssl genrsa -out $ROOT_CA_KEY 2048
openssl req -x509 -new -nodes -key $ROOT_CA_KEY -sha256 -days $DAYS_VALID \
    -subj "/C=US/ST=Local/L=Development/O=Development CA/CN=Development Root CA" \
    -out $ROOT_CA_CERT

# Step 2: Generate Private Key for the Wildcard Domain
echo "Generating private key for the wildcard domain..."
openssl genrsa -out $DOMAIN_KEY 2048

# Step 3: Create Certificate Signing Request (CSR)
echo "Creating CSR for the wildcard domain..."
openssl req -new -key $DOMAIN_KEY \
    -subj "/C=US/ST=Local/L=Development/O=Development/CN=$DOMAIN" \
    -out $DOMAIN_CSR

# Step 4: Create Extensions File for SAN
echo "Creating extensions file..."
cat > $EXT_FILE <<EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth, clientAuth
subjectAltName = @alt_names

[alt_names]
DNS.1 = $BASE_DOMAIN
DNS.2 = *.$BASE_DOMAIN
EOF

# Step 5: Sign the Certificate with the Root CA
echo "Signing the certificate with the Root CA..."
openssl x509 -req -in $DOMAIN_CSR -CA $ROOT_CA_CERT -CAkey $ROOT_CA_KEY \
    -CAcreateserial -out $DOMAIN_CERT -days $DAYS_VALID -sha256 -extfile $EXT_FILE

# Output success message and file locations
echo "Wildcard certificate generated successfully!"
echo "Files are located in: $CERT_DIR"
echo "Root CA Certificate: $ROOT_CA_CERT"
echo "Domain Private Key: $DOMAIN_KEY"
echo "Domain Certificate: $DOMAIN_CERT"