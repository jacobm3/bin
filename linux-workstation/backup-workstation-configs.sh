#!/bin/bash
#

cd ~
tar zcvf workstation-configs-$(date +%Y.%m.%d-%H.%M.%S).tgz \
	.chromium-browser.init .gtk* .config .themes 
