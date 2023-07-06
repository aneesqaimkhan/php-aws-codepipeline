#!/bin/bash
if ! [ -x "$(command -v httpd)" ]; then
  yum install -y httpd24 >&2
fi
# Install Apache if not already installed
