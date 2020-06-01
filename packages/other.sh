#!/bin/sh

# fnm (Node JS)
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash
fnm install 12.16.1
fnm use 12.16.1
fnm default 12.16.1