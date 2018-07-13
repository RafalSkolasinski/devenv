# Deprecation notice

This is depracted. I do not guarantee that it will still work.
See my [science-docker](https://gitlab.kwant-project.org/qt/r-j-skolasinski/science-docker) repository for currently supported solution.








# Motivation
Despite the fact that setting development environment for Kwant using
``virtualenv`` or ``conda`` is relatively easy task it quickly start to
be tedious and tiresome. If in addition you work on few different machines,
as I like to do, it starts to get even more annoying.

Here I present yet another solution, a dockerized development environment.
Assuming that you keep your Kwant sources in `` ~/projects/kwant`` you can
start development container with:

```bash
docker pull rafalskolasinski/kwant-devenv:latest
docker run -d -p 8888:8888 --name dev -v ~/projects/kwant:/src rafalskolasinski/kwant-devenv
```

This will start a ``Jupyter Notebook`` server running at your ``localhost:8888``.
You can use it to play with your changes, after you build and test them with

```bash
docker exec dev build
docker exec dev test
```

Note: if you add ``--rm`` to the ``docker run`` command then container will be
removed when stopped.


# Persistent notebook folder
Notebooks are stored inside the container in ``/notebooks`` volume.
You can add binding to your local folder by adding
``-v /absolute/path/to/your/folder:/notebooks`` to ``docker run ...`` command.



# Building and testing
Building is done in ``/src`` and affects your mounted directory.
You can instantly test your code by running
```bash
docker exec dev build
docker exec dev test -v --cov=kwant --cov-report term --flakes kwant
```
Note: everything after ``test`` are arguments passed to ``py.test``

If you want to start a clean build run following command in your ``kwant`` folder:
```
git clean -fxd .
```



# To remove container and image use:
```bash
docker kill dev
docker rm dev
docker rmi rafalskolasinski/kwant-devenv
```



# Warning
Be aware that ``jupyter notebook`` in this container runs without token.
