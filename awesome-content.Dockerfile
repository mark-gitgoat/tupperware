FROM node:22.18.0-bullseye

WORKDIR /usr/src/app

RUN npm i aws-sdk@2.1297.0

COPY package.json package-lock.json ./

RUN npm install

RUN echo "Arnica is awesome!!!"

COPY . .

RUN cat /etc/os-release

CMD ["echo", "hello", "world"]

# ================ ARNICA SECURITY ANNOTATION BLOCK START ================
LABEL org.opencontainers.image.source="https://github.com/mark-gitgoat/tupperware"
LABEL org.opencontainers.image.path="awesome-content.Dockerfile"
# These automated labels, added by the security team, enhance traceability and security.
# For more details, see: https://docs.arnica.io/arnica-documentation/developers/adding-oci-tags-to-docker-images.
# To exclude this file, please replace this change with: #arnica-ignore followed by the dismissal reason.
# A message from the security team: Code comment added by Arnica to provide context for security scans. Do not remove.
# ================ ARNICA SECURITY ANNOTATION BLOCK END ================
