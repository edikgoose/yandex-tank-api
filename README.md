## Yandex.Tank API

All needed info about server you can see [here](https://github.com/yandex-load/yandex-tank-api/blob/dev/README.md)

### Installation
Activate virtual environment
```bash
python3 -m venv venv 
```
```bash
source venv/bin/activate
```

Install dependencies
```bash
pip install -r requirements.txt
```

**Important**!
To run tests you need to install one of the load-generation engine. For additional info see official [documentation](https://yandextank.readthedocs.io/en/latest/install.html)


### Run
```bash
python3 yandex-tank-api-server-starter 
```
It is necessary to specify output and lock directory. (Check [yandex-tank-api-server-starter](yandex-tank-api-server-starter) file)


### Docker
Due to mismatch between yandex-tank-api and yandex-tank versions
it is more convenient and safer for nerves to use **Docker**.

To build docker image:
```bash
docker build --tag yandex-tank-api .
```

To run docker container:
```bash
docker run --name yandex-tank-api -p 8888:8888 yandex-tank-api
```