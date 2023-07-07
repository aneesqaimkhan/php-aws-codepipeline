#!/bin/bash
systemctl stop httpd
systemctl list-unit-files | grep "httpd"
