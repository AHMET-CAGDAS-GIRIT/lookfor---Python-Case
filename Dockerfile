FROM ubuntu

#If I said "FROM python" many commands would be missing and not booted to init.

WORKDIR /app

RUN apt-get update

RUN apt-get install -y sudo

RUN sudo apt-get install -y python3

RUN sudo apt install -y python3.12-venv

RUN sudo apt-get install -y python3-pip

RUN sudo apt install -y curl

RUN pip3 install ollama --break-system-packages

RUN curl -fsSL https://ollama.com/install.sh | sh

RUN sudo apt -y install systemd

#RUN sudo systemctl daemon-reload

#RUN sudo systemctl restart ollama

#RUN ollama serve

#For whatever reason this command never finishes.

#RUN ollama pull llama2

COPY chatbot.py .

#CMD ["python3","chatbot.py"]


#We must keep the container running if we wan't to modify it (for example putting a LLM)
#If we try to run chatbot.py every single run the container , we wouldn't be able to put anything after the creation of the image
