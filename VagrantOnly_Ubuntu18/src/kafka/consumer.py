#
#
# Author: Aniruddha Gokhale
# CS4287-5287: Principles of Cloud Computing, Vanderbilt University
#
# Created: Sept 6, 2020
#
# Purpose:
#
#    Demonstrate the use of Kafka Python streaming APIs.
#    In this example, demonstrate Kafka streaming API to build a consumer.
#

import sys
import os  # need this for popen
import time  # for sleep
from kafka import KafkaConsumer  # consumer of events

# We can make this more sophisticated/elegant but for now it is just
# hardcoded to the setup I have on my local VMs

# acquire the consumer
# (you will need to change this to your bootstrap server's IP addr)
consumer = KafkaConsumer(bootstrap_servers="localhost:9092")

# subscribe to topic
consumer.subscribe(topics=["utilizations"])

# we keep reading and printing
for msg in consumer:
    formatted = str(msg.value, 'ascii')
    
    if formatted == "Q":
    	break

    # convert the value field into string (ASCII)
    print(formatted)

consumer.close()
sys.exit()
