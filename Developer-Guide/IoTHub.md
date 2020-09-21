
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
