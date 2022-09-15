#!/bin/sh
if  command -v kubectx >/dev/null 2>&1; then 
    echo "kubectx already installed"
else
    sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
    sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
    sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
fi