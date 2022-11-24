import time
import redis
from flask import Flask

alationwebcounterassignment = Flask(__name__)
cache = redis.Redis(host='redis-node', port=6379)


def get_alationwebcounterassignment():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)


@alationwebcounterassignment.route('/')
def hit():
    count = get_alationwebcounterassignment()
    return 'Holla! we have hit %i times.\n' % int(count)


if __name__ == "__main__":
    alationwebcounterassignment.run(host="0.0.0.0", debug=True)
