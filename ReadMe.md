# Robot Youtube Sample

[![nishantrevo](https://circleci.com/gh/nishantrevo/robot-youtube-sample.svg?style=svg)](https://app.circleci.com/pipelines/github/nishantrevo/robot-youtube-sample/)
Sample project to run UI tests on youtube using:

- Python3
- Robot Framework
- Selenium
- Selenium Grid
- CircleCI

## Project structure

- `tests` : Directory of test robot files.
- `lib` : Directory of library of robot keywords and python files.
- `lib/pages` : Directory of robot files for each page/component keywords.
- `resources` : Directory of scripts and variable file.
- `requirements.txt` : Dependecies list for pip.
- `.python-version` : Python version for pyenv.

## Pre-requisites

- Python 3 - 3.9.0 and using pyenv is recommended. See [docs](https://github.com/pyenv/pyenv#installation) to get started. Pyenv [command](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md)
- Browser installations for local execution

## Setup

### Create virutal environment

- Install python 3.9.0 if pyenv is installed and configured correctly

```
pyenv install 3.9.0
```

- cd to project directory

```
cd /path/to/robot-youtube-sample
```

- Check pyenv switched to correct python version. Output should match to same version.

```
pyenv local
python -V
```

- Create virtual environment

```
python -m venv venv
source venv/bin/activate
```

### Install dependecies using pyenv and pip

- Install dependecies

```
pip install -r requirements.txt
```

### Install drivers for local execution

This project uses [webdrivermanager](https://github.com/rasjani/webdrivermanager) for drivers dependecies

- Install chromedriver

```
webdrivermanager chrome
```

- Install geckodriver

```
webdrivermanager geckodriver
```

### Start local Selenium grid

Pre-requisite

- Docker installed and running

Change permission of script

```
chmod +rwx ./resources/grid.sh
```

Start grid

```
./resources/grid.sh up
```

Close grid

```
./resources/grid.sh down
```

## Run Tests

- Run test locally

```
robot --outputdir reports --variablefile resources/variables.yaml test/
```

- Run test in local grid

```
robot --outputdir reports --variable grid_url:http://localhost:4444/wd/hub --variablefile resources/variables.yaml tests
```

- Run test with different variables file
  Create a new yaml variable file

```
robot --outputdir reports --variablefile path/to/new.yaml tests/
```

- Override variable in variables file

```
robot --outputdir reports --variable searchKeyword:"dua lipa break my heart" --variablefile var.yaml test
```

## Reports

Following reports are generated:

- `reports/log.html` : HTML log of test execution.
- `reports/report.html` : HTML summary test result.
- `reports/output.xml` : Robot default XML report.
