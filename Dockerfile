FROM python:3.7.0b4-stretch

# Atom configs copied from jamesnetherton https://hub.docker.com/r/jamesnetherton/docker-atom-editor/
MAINTAINER Eduardo Mendes github.com/dunossauro

ENV ATOM_VERSION v1.27.2

RUN apt-get update && \
apt-get install -y --no-install-recommends \
ca-certificates \
curl \
fakeroot \
gconf2 \
gconf-service \
git \
gvfs-bin \
libasound2 \
libcap2 \
libgconf-2-4 \
libgtk2.0-0 \
libnotify4 \
libnss3 \
libxkbfile1 \
libxss1 \
libxtst6 \
libgl1-mesa-glx \
libgl1-mesa-dri \
xdg-utils && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
curl -L https://github.com/atom/atom/releases/download/${ATOM_VERSION}/atom-amd64.deb > /tmp/atom.deb && \
dpkg -i /tmp/atom.deb && \
rm -f /tmp/atom.deb && \
useradd -d /home/atom -m atom && \
pip install ipython ipdb toolz && \
apm install platformio-ide-terminal linter linter-pylama

USER atom

RUN mkdir -p ~/workdir

CMD ["/usr/bin/atom","-f","~/workdir"]
