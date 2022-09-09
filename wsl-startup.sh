#!/bin/bash

echo -n Docker:
pgrep dockerd || sudo service docker start


