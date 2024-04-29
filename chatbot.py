import ollama
import sys



"""This is a python chatbot.It utilizes llama2 LLM to process the inputs.
This python code acts as an interface between llama2 LLM and end user."""

print("Welcome to chatbot.Feel free to chat and have request. Please type 'exit' in order to end the converstaion")
full_conversation = [] # Stores all the recent use inputs.
memory_level = 1 # Determines how much of the previous conversation our chatbot remembers.Currently creates problems when larger than 1. 
for user_input in sys.stdin: # The chat will continue until the user explicitly states "exit".
    # I had to use sys.stdin in order to prevent EOF errors. The container should be run with "docker run -ti lookforaicase" .
    user_input.lstrip()
    word_list = user_input.split()
    if(len(word_list) == 1):
        if(word_list[0].lower() == 'exit'):
            break
    # Otherwise a response will be created.
    if(len(full_conversation) < memory_level):
        full_conversation.append(user_input)
    else:        
        full_conversation.append(user_input)
        full_conversation.pop(0)
    response = ollama.generate(model='llama2', prompt='\n'.join(full_conversation)) # Generates the chatbot's output.
    print(response['response'])
print("Thanks for using this chatbot.")    
