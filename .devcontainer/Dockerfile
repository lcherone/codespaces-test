# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.191.1/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version: bullseye, buster, stretch
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

USER root

RUN apt -y install --no-install-recommends apt-utils 2>&1 \
    && apt -y install --no-install-recommends apt-transport-https 2>&1 \
    && apt -y install --no-install-recommends lsb-release 2>&1 \
    && apt -y install --no-install-recommends ca-certificates 2>&1 \
    && apt -y install build-essential 2>&1 \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt -y install --no-install-recommends php7.4 php7.4-bcmath php7.4-bz2 php7.4-intl php7.4-gd php7.4-mbstring php7.4-mysql php7.4-zip php7.4-dom php7.4-yaml php7.4-curl php7.4-xdebug apache2 \
    && echo "Listen 8000" >> /etc/apache2/ports.conf && a2enmod rewrite \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install mariadb
RUN apt update && export DEBIAN_FRONTEND=noninteractive && apt -y install mariadb-server mariadb-client \
    && sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf  \
    && service mysql start    

# Install nvm with node and npm
ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 16.7.0
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH
