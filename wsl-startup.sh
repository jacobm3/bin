#!/bin/bash

pgrep dockerd &>/dev/null || sudo service docker start

pgrep cron &>/dev/null || sudo service cron start


