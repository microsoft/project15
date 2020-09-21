# X.509 Certificate

## Digital Signature

The mechanism on how private and public key are used in validating data integrity is the basic concept for X.509 certificate.

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