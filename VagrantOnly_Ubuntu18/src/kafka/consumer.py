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
from kafka import KafkaConsumer

from cloudant.client import CouchDB

couch = CouchDB("admin", "admin", url='http://129.114.25.202:5984', connect=True)
consumer = KafkaConsumer(bootstrap_servers="localhost:9092")

# subscribe to topic
consumer.subscribe(topics=["utilizations"])

if "db" not in couch:
    couch.create_database("db")

# we keep reading and printing
for msg in consumer:
    formatted = str(msg.value, 'ascii')
    
    if formatted == "Q":
    	break

    couch["db"].create_document({"value": formatted})

    # convert the value field into string (ASCII)
    print(formatted)

consumer.close()
sys.exit()
