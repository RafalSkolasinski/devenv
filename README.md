

# build
docker build -t devenv .


# start
docker run -d -p 8888:8888 --name notebook  \
    -v /notebooks -v ~/playground/kwant:/kwant \
    devenv



# clean
docker kill notebook && docker rm notebook
