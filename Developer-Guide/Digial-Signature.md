# X.509 Certificate

## Digital Signature

The mechanism on how private and public key are used in validating data integrity is the basic concept for X.509 certificate.
There is a set of rules for the key pair logic.

## Symmetric Encryption vs. Asymmetric Encryption

Imagine a scenario you needs to send a sensitive document to your friend.  The basic method is to encrypt (or protect) with a password.  When your friend receives the document, he/she needs your password.  The question is how you want to share your password with your friend?  This is called Symmetric Encryption

Asymmetric Encryption is designed to solve this problem.  Asymmetric Encryption is how old fashion physical mailbox works.  This is achieved by generating a pair of key, called Private Key and Public Key.  They are mathematically linked to each other, called RSA algorithm.

Public Key is like the mailing address.  It's public and everyone can know.  
Private Key is like a key to the mailbox.  Only the owner of the mailbox keeps it.

Now with Private key and Public key, you can securely exchange the sensitive document.

1. Exchange **Public Key** (e.g. get your friend's mailing address)
1. Encrypt the sensitive document with **Private key** and send it to your friend.  (e.g. Seal your letter with Private Key)
1. Your friend receives the document and decrypt with **Public key** (E.g. Unlock the letter with your Public Key)

## Rules

- Only **Private key** can decrypt data encrypted with public key (Private key cannot decrypt)
- Only **Public key** can decrypt data encrypted with private key (Public key cannot decrypt)
- Private key is stored in a safe location (e.g. secure server)
- Public key is shared with clients
- Client encrypts data with the public key.  => Only the server with the matching private key can decrypt data.
- Server encrypts data with the private key. => Only clients with the matching public key can decrypt data.

## A key pair - Private Key and Public Key to encrypt and decrypt

The following is the steps to illustrate how the private key and the public key are used to ensure the data came from the trusted source, and contents are not modified.

1. Generate a key pair, **Private Key** and **Public Key**

    ![key pair 1](media/Key-Pair-01.png)

1. Public key must be shared with the other side of the communication (receiver).  

    ![key pair 2](media/Key-Pair-02.png)

1. Prepare data that needs to be shared/sent to the receiver  

    ![key pair 3](media/Key-Pair-03.png)

    > [!NOTE]
    > If you send data as is, there is no way to guarantee the integrity of data

1. Create a **signature** using **private key** and data  

    ![key pair 4](media/Key-Pair-04.png)

1. Send **data** with the **signature** to the receiver  

    ![key pair 5](media/Key-Pair-05.png)

1. The receiver validates the integrity using public key  

    ![key pair 6](media/Key-Pair-06.png)

## Certificate Chain

Now you can see how to validate the integrity of data using public key and private key.  Now the question is **How do I know my key is really valid?**

https://qiita.com/TakahikoKawasaki/items/4c35ac38c52978805c69