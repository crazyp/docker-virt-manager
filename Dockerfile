FROM mber5/broadway-baseimage:debian

ENV FAVICON_URL='https://raw.githubusercontent.com/virt-manager/virt-manager/931936a328d22413bb663e0e21d2f7bb111dbd7c/data/icons/256x256/apps/virt-manager.png'
ENV APP_TITLE='Virtual Machine Manager'
ENV CORNER_IMAGE_URL='https://raw.githubusercontent.com/virt-manager/virt-manager/931936a328d22413bb663e0e21d2f7bb111dbd7c/data/icons/256x256/apps/virt-manager.png'
ENV BACKGROUND_URL='https://webgradients.com/public/webgradients_png/018%20Cloudy%20Knoxville.png'
ENV HOSTS="[]"

RUN apt-get update
RUN apt-get install -y --no-install-recommends virt-manager dbus-x11 libglib2.0-bin gir1.2-spiceclientgtk-3.0 ssh 
RUN apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.ssh
RUN echo "Host *\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

COPY startapp.sh /usr/local/bin/startapp

CMD ["/usr/local/bin/startapp"]
