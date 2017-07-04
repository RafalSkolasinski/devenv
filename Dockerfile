# Docker image for developing kwant
FROM kwant/testing

MAINTAINER Kwant developers <authors@kwant-project.org>


# setup jupyter notebook
RUN pip3 install jupyter
ADD notebook.sh /srv/
EXPOSE 8888


CMD ["sh", "/srv/notebook.sh"]
