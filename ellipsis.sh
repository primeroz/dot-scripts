#!/usr/bin/env bash
##############################################################################
# @file ellipsis.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
##############################################################################

pkg.link() {
    fs.link_file "$PKG_PATH/bin/terminus" "$ELLIPSIS_HOME/bin/terminus"

    # Link package into ~/.scripts
    #fs.link_file "$PKG_PATH"
}

##############################################################################

pkg.install(){

    mkdir -p $PKG_PATH/bin

    # Install Terminus
    cd $PKG_PATH/bin
    wget -q -O - https://github.com/jtopjian/terminus/releases/download/v0.1.0/terminus.gz | gunzip -q > terminus
    chmod 755 terminus


}

##############################################################################

pkg.pull(){

    # Update dot-i3 repo
    #iit.pull

    # Update the config file
    #$PKG_PATH/compile.sh
    exit 0
}

##############################################################################
