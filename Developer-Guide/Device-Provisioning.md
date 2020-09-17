# Open Platform Developer Guide : Device Provisioning

Connecting an IoT device to cloud starts with provisioning the device to IoT Hub.  Provisioning an IoT device involves :

1. Attesting the device identity  
    This is to check the validity of the device to ensure devices connected to the cloud solution are known and trusted.
1. Creating a device identity  
    Once the device is confirmed its validity, the device must be registered in the system.
1. Apply the initial configuration
    (Optional) When the device connects to the cloud solution for the first time, DPS can apply the initial configuraion.

[Device Provisioning Service](https://docs.microsoft.com/en-us/azure/iot-dps/about-iot-dps) (DPS) is a helper service for IoT Hub that enables zero-touch, just-in-time provisioning to the right IoT hub without requiring human intervention.

Once the IoT device is provisioned to the right IoT Hub, the IoT device can initiate connection to the assigned IoT Hub in secure fashion.

Azure IoT Hub provides :

- Secure connection
- Bi-directional communication
- Device Management through Device Twin

This document covers provisioning and establishing connection to IoT Hub.

## Automatic Device Provisioning

DPS is initialized in the Open Platform as one of default components.  It is configured to provision devices to IoT Hub. 

To provision a new device to IoT Hub, you must :

1. Create Enrollment Entry
1. Specify attestation security methods  
    Options are :  
    - Symmetric Key
    - X.509 certificate
    - TPM
1. Configure allocation policy  
    The allocation policy is used to determine the assignment of IoT devices to IoT Hub.  The Open Platform is deployed a single IoT Hub so the assignment is static to the deployed IoT Hub.

### Device Provisioning Configuration Summary

DPS is deployed with following configurations.

| Setting           | Purpose                      | Name                       |
|-------------------|------------------------------|----------------------------|
| SKU               | S1                           | $0.123 per 1000 operations |
| Allocation Policy | Evenly Weighted Distribution |                            |

### Provision Device

> [!NOTE]  
> Version 1 of the Open Platform Sample Web App does not have DPS sample.

In order to provision an IoT device, a new enrollment entry must be created.

Until DPS is implemented in the sample web app, please follow instruction [here](https://docs.microsoft.com/en-us/azure/iot-dps/how-to-manage-enrollments)

## Manual Device Provisioning

Instead of provisioning devices with DPS, you may provision IoT devices manually.  Manual provisioning involves following steps :

1. Create a new device identity (Device ID)
1. Configure a security credential
    - Symmetric Key
    - X.509 certificate

Depending on device types and/or connectivity type (e.g. WiFi vs. LTE), you should use the right authentication method.  Please consult with your device provider for the recommended authentication method(s).

To Do : Add Link to the sample web app

### Symmetric Key

Symmetric key authentication is a simple approach to authenticating a device with IoT Hub.

More on Symmetric key : <https://en.wikipedia.org/wiki/Symmetric-key_algorithm>

With symmetric key, devices can be authenticated using Shared Access Token (SAS).  This is also called `Connection String`

> [!IMPORTANT]  
> Each device must have its own Device ID, thus SAS token.  Never share Device ID nor SAS token among multiple devices.

### X.509 certificate

While symmetric key authentication is a convenient during development or managing small number of devices, it is cumbersome if there are a large number of devices.

## Azure IoT Hub

Azure IoT Hub provides secure, bi-directional communication between IoT devices and a cloud solution.  IoT Hub act as a gateway to the cloud.  All device communications go through IoT Hub.

Azure IoT Hub provides :

- Secure, bi-directional communication
- Device Management

### IoT Hub Configuration Summary

IoT Hub is deployed with following configurations :


| Setting           | Purpose | Name                                                                              |
|-------------------|---------|-----------------------------------------------------------------------------------|
| SKU               | S1      | $25/Month ([Pricing](https://azure.microsoft.com/pricing/details/iot-hub/))       |
| Message Retention | 1 day   | how long in days messages are retained by IoT Hub                                 |
| Partition Count   | 4       |                                                                                   |
| Message Routings  | Multiple        | Please refer to [Data Ingestion Developer Guide](Data-Ingestion-Data-Pipeline.md) |

### Bi-directional communication

IoT Hub supports following communication types :

1. Device to Cloud (D2C) messaging

    Please refer to [Data Ingestion Developer Guide](Data-Ingestion-Data-Pipeline.md)

1. Cloud to Device (C2D) messaging

    Devices can receive message from cloud through IoT Hub.  C2D must be supported by the device.  Please consult with your device manufacturer.

1. Direct Method

    The solution can invoke methods from cloud.  Unlike C2D, Direct Method is synchronous, meaning caller (typically IoT solution) can receive a response, with timeout.  Direct Method should be used for critical operations such as the caller needs to receive responses.

1. Device Twin

    IoT Hub maintains small storage for each Device ID, called Device Twin.  Device Twin is typically used to communicate properties and settings between devices and cloud.

    Device Twin is covered more in Device Management Developer Guide.

## Potential Customization Options

More functionalities and user experiences can be added to the deployed solution depending on requirements.  Possible customizations are :

- Add an administrative UI to manage DPS enrollment  
    Including X.509 certificate management
- Device Management  
    Depending on capabilities of the devices integrated to the deployed solution, more device management capabilities may be required

