from google.cloud import pubsub_v1
import base64
import json
import redis
import os

def message_from_topic3(request, message):
    project_id = os.environ.get('project')
    subscription_name = "topic3"
    ip_redis = os.environ.get('ip_redis')
    subscriber = pubsub_v1.SubscriberClient()
    r = redis.StrictRedis(host=ip_redis, port=6379, db=0)

    subscription_path = subscriber.subscription_path(
    project_id, subscription_name)

    def callback(message):
        print('Received message: {}'.format(message))
        message.ack()

    subscriber.subscribe(subscription_path, callback=callback)
    
    c = request
    b = base64.b64decode(c['data'])
    print(b)
    d = b.decode('utf-8')
    a = json.loads(d)
    city = a['id']
    print(city)
    r.set(city,b)

    print('Listening messages {0}, {1}'.format(a, type(a)))
