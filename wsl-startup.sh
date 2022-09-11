#!/bin/bash

echo -n Docker:
pgrep dockerd || sudo service docker start

echo -n Cron:
pgrep cron || sudo service cron start


