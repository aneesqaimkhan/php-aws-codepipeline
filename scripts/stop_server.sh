#!/bin/bash
service httpd stop
systemctl list-unit-files | grep httpd