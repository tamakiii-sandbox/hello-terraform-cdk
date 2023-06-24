FROM ubuntu:20.04

ARG NODE_VERSION=20.3.1

ENV DEBIAN_FRONTEND=noninteractive

COPY bin /usr/local/bin

RUN apt update -y && \
    apt install -y \
      gpg \
      curl \
      && \
    apt clean all

# RUN useradd --uid 1000 --gid staff --shell /bin/bash --create-home content-user

# RUN set -ex \
#   && for key in \
#     4ED778F539E3634C779C87C6D7062848A1AB005C \
#     141F07595B7B3FFE74309A937405533BE57C7D57 \
#     74F12602B6F1C4E913FAA37AD3A89613643B6201 \
#     DD792F5973C6DE52C432CBDAC77ABFA00DDBF2B7 \
#     61FC681DFB92A079F1685E77973F295594EC4689 \
#     8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
#     C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
#     890C08DB8579162FEE0DF9DB8BEAB4DFCF555EF4 \
#     C82FA3AE1CBEDC6BE46B9360C43CEC45C17AB93C \
#     108F52B48DB57BB0CC439B2997B01419BD92F80A \
#   ; do \
#       gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys "$key" || \
#       gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key" ; \
#   done

# RUN export ARCH=$(/usr/local/bin/architecture.sh) && \
#   curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
#   && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
#   && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
#   && grep " node-v$NODE_VERSION-linux-$ARCH.tar.xz\$" SHASUMS256.txt | sha256sum -c -

# RUN export ARCH=$(/usr/local/bin/architecture.sh) && \
#   tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
#   && rm "node-v$NODE_VERSION-linux-$ARCH.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt \
#   && ln -s /usr/local/bin/node /usr/local/bin/nodejs

# # smoke tests
# RUN node --version \
#   && npm --version

# RUN ARCH=$(/usr/local/bin/architecture.sh)

# RUN curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz"

# # gpg keys listed at https://github.com/nodejs/node#release-keys
# RUN set -ex && \
#   && for key in \
#     4ED778F539E3634C779C87C6D7062848A1AB005C \
#     141F07595B7B3FFE74309A937405533BE57C7D57 \
#     74F12602B6F1C4E913FAA37AD3A89613643B6201 \
#     DD792F5973C6DE52C432CBDAC77ABFA00DDBF2B7 \
#     61FC681DFB92A079F1685E77973F295594EC4689 \
#     8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
#     C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
#     890C08DB8579162FEE0DF9DB8BEAB4DFCF555EF4 \
#     C82FA3AE1CBEDC6BE46B9360C43CEC45C17AB93C \
#     108F52B48DB57BB0CC439B2997B01419BD92F80A \
#   ; do \
#       gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys "$key" || \
#       gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key" ; \
#   done

# RUN apt update -y && \
#     apt install -y --no-install-recommends \
#       npm:

# RUN apt update -y && \
#     apt install -y --no-install-recommends \
#       npm
      
# COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
