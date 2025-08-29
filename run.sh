#!/usr/bin/env bash
echo "Starte NRF24 Receiver Add-on..."

# Python-Skript ausführen
python3 - << 'EOF'
import time
from RF24 import RF24

# SPI-Pins anpassen, je nach Raspberry Pi
radio = RF24(22, 0)  # CE=GPIO22, CSN=SPI0.0
radio.begin()
radio.setPALevel(RF24.RF24_PA_LOW)
radio.openReadingPipe(1, b"1Node")
radio.startListening()

print("NRF24 Receiver läuft. Warte auf Pakete...")

while True:
    if radio.available():
        received_payload = []
        radio.read(received_payload, radio.getDynamicPayloadSize())
        print(f"Empfangen: {received_payload}")
    time.sleep(1)
EOF
