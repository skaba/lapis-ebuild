# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header : $

MY_P=${P}-src
DESCRIPTION="A very simple utility to convert DiscJuggler image to the standard ISO-9660 format."
HOMEPAGE="http://developer.berlios.de/projects/cdi2iso"
SRC_URI="http://download.berlios.de/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S=${WORKDIR}/${PN}

src_compile() {
	gcc ${CFLAGS} src/cdi2iso.c -o cdi2iso
}

src_install() {
	dobin cdi2iso
	dodoc CHANGELOG gpl.txt
}
