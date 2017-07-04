

# build
docker build -t devenv .


# start
docker run -dp 8888:8888 --name notebook devenv



# clean
docker kill notebook && docker rm notebook
