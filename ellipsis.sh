#!/usr/bin/env bash
##############################################################################
# @file ellipsis.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
##############################################################################

pkg.link() {
    # Link package into ~/.scripts
    #fs.link_file "$PKG_PATH"
    #fs.link_file "$PKG_PATH" "$ELLIPSIS_HOME/.config/i3"
    exit 0
}

##############################################################################

pkg.install(){
    mkdir -p $PKG_PATH/bin
    cd $PKG_PATH/bin
    wget -O - https://github.com/jtopjian/terminus/releases/download/v0.1.0/terminus.gz | tar xvf -
}

##############################################################################

pkg.pull(){

    # Update dot-i3 repo
    #git.pull

    # Update the config file
    #$PKG_PATH/compile.sh
    exit 0
}

##############################################################################
