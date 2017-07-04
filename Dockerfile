# Docker image for developing kwant
FROM kwant/testing

MAINTAINER Kwant developers <authors@kwant-project.org>


# setup jupyter notebook
RUN pip3 install \
    notebook==5.0.0 \
    sympy==1.0

ADD notebook.sh /srv/
EXPOSE 8888
ENV SHELL /bin/bash


# add and expose building script
ADD build.sh /opt/bin/build
ENV PATH="/opt/bin:${PATH}"


# add volume and workdir
VOLUME /notebooks /kwant
WORKDIR /notebooks


CMD ["sh", "/srv/notebook.sh"]
