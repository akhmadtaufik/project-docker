FROM python:3.9.16

COPY . ./todo-app

WORKDIR /todo-app

RUN pip install -r requirements.txt

EXPOSE 5000

CMD [ "flask", "run" ]
