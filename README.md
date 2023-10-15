# FastAPI-REST-API
Production ready Fast API based REST API which can be used as a starting point for your API needs. It includes custom logging feature and ca be run as a docker container.


### Technologies
Open source powered technology stack are as follows:
* [FastAPI](https://fastapi.tiangolo.com/) - Modern, fast (high-performance), web framework for building APIs with Python 3.6+ based on standard Python type hints


### Installation
Analytics Miscroservice requires [Python3.6](https://www.python.org/) to run.



#### Application

```sh
cd app
python3 -m pip install -r requirements.txt
```
Configurations in settings python file has to be updated as per the environment

```sh
$ uvicorn app.main:app
```



