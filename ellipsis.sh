#!/usr/bin/env bash
##############################################################################
# @file ellipsis.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
##############################################################################

pkg.link() {
    fs.link_file "$PKG_PATH/bin/terminus" "$ELLIPSIS_HOME/bin/terminus"

    fs.link_file "$PKG_PATH/bin/elktail" "$ELLIPSIS_HOME/bin/elktail"

    # Link package into ~/.scripts
    fs.link_file "$PKG_PATH/scripts"
}

##############################################################################

pkg.install(){

    mkdir -p $PKG_PATH/bin

    # Install Terminus
    cd $PKG_PATH/bin
    wget -q -O - https://github.com/jtopjian/terminus/releases/download/v0.1.0/terminus.gz | gunzip -q > terminus
    chmod 755 terminus

    # Install ELKTail
    cd $PKG_PATH/bin
    wget -q -O - https://github.com/knes1/elktail/releases/download/v0.1.4/elktail_linux_amd64.tar.gz | tar xzf -
    chmod 755 elktail

}

##############################################################################

pkg.pull(){

    # Update dot-i3 repo
    git.pull

    # Re Link as needed
    pkg.link

    # Update the config file
    #$PKG_PATH/compile.sh
}

##############################################################################
