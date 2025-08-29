FROM ghcr.io/home-assistant/amd64-base-python:3.12-alpine

# Arbeitsverzeichnis
WORKDIR /app

# Installiere benötigte Pakete
RUN apk add --no-cache python3 py3-pip git build-base

# Kopiere Skripte
COPY run.sh /app/run.sh

# Installiere Python-Abhängigkeiten
RUN pip install --no-cache-dir spidev pyRF24

# Setze Ausführungsrechte
RUN chmod +x /app/run.sh

# Startbefehl
CMD [ "/app/run.sh" ]
