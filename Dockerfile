FROM python:3.9.9-alpine

RUN pip3 install flask

WORKDIR /app/

COPY application.py .

EXPOSE 5000

CMD ["python3", "application.py"]