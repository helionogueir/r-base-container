# OS
FROM ubuntu:18.04

# Timezone
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install R
RUN apt update && apt upgrade -y && apt install r-base -y

# Create an R user
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chown -R user:user $HOME
VOLUME [ $HOME/workspace ]
WORKDIR $HOME/workspace
USER user