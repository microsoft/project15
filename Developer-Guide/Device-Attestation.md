# DPS Device Attestation Mechanism

DPS supports 3 device attestation mechanisms.  This document covers summary of each mechanism, pros and cons to help solution architects and developers to make educated decisions.

## Symmetric Key

Symmetric key authentication is a simple approach to authenticating a device with IoT Hub. 

More on Symmetric key : <https://en.wikipedia.org/wiki/Symmetric-key_algorithm>

With symmetric key, devices can be authenticated using Shared Access Token (SAS).  This is also called `Connection String`

> [!IMPORTANT]  
> Each device must have its own Device ID, thus SAS token.  Never share Device ID nor SAS token among multiple devices.

More on Symmetric key attestation : <https://docs.microsoft.com/en-us/azure/iot-dps/concepts-symmetric-key-attestation>

### Pros

- A great way to support legacy devices with limited security functionality
- A quick, easy way for developers

### Cons

- Difficult to manage many devices as each device must be assigned an unique key

## X.509 certificate

While symmetric key authentication is a convenient during development or managing small number of devices, it is cumbersome if there are a large number of devices.  The certificate based attestation is more scalable and secure than Symmetric key based attestation.  X.509 certificates based authentication is widely used for many industrial and consumer scenarios.  

### Public Key and Private Key

Public key and private key pair is use to validate validity of data.



3 types of certificates are used in X.509 certificates based attestation.

1. Root certificate
1. Intermediate certificate
1. End-entry, or leaf, certificate

### Root Certificate

A root certificate is a self-signed X.509 certificate representing a certificate authority (CA). It is the terminus, or trust anchor, of the certificate chain. Root certificates can be self-issued by an organization or purchased from a root certificate authority. To learn more, see Get X.509 CA certificates. The root certificate can also be referred to as a root CA certificate.

For example, you can purchase (or self generate) a certificate for your organization for all certificate based authentication and attestations.

### Intermediate Certificate

An intermediate certificate is an X.509 certificate, which has been signed by the root certificate (or by another intermediate certificate with the root certificate in its chain). The last intermediate certificate in a chain is used to sign the leaf certificate. An intermediate certificate can also be referred to as an intermediate CA certificate.

## Trusted Platform Module (TPM)

A TPM is a type of hardware security module (HSM).  

[Brief Introduction of TPM](https://trustedcomputinggroup.org/wp-content/uploads/TPM-2.0-A-Brief-Introduction.pdf) by Trusted Computing Group



