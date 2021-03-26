import os   # need this for popen
import time # for sleep
from kafka import KafkaProducer  # producer of events

producer = KafkaProducer (bootstrap_servers="129.114.25.83:9092", 
                                          acks=1)  # wait for leader to write to log

while True:
    contents = input("> ")
    print(contents)
    producer.send("utilizations", value=bytes(contents, "ascii"))
    producer.flush()   # try to empty the sending buffer

    # sleep a second
    # time.sleep(1)

# we are done
producer.close()
    






