# FROM mageai/mageai:latest

# ARG USER_CODE_PATH=/home/src/${PROJECT_NAME}

# # Note: this overwrites the requirements.txt file in your new project on first run. 
# # You can delete this line for the second run :) 
# COPY requirements.txt ${USER_CODE_PATH}requirements.txt 

# RUN pip3 install -r ${USER_CODE_PATH}requirements.txt

FROM python:latest

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-client \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]docker build .