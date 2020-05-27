#!/bin/sh

# fnm (Node JS)
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash
fnm install 11.12.0
fnm use
fnm install
fnm use
fnm use 11.12.0
fnm default 11.12.0