FROM python

WORKDIR /app

RUN pip install ollama

COPY chatbot.py .

CMD ["ollama","pull","llama2","&&","python","chatbot.py"]

# We need "ollama" function to work in order to pull the llama2 LLM inside the container. 
# However the installation of ollama isn't done on console and I don't know what to do.