# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

MY_P=${P}-src
DESCRIPTION="A very simple utility to convert an instant copy bin image to the standard ISO-9660 format."
HOMEPAGE="http://developer.berlios.de/projects/pdi2iso"
SRC_URI="http://download.berlios.de/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S=${WORKDIR}/${MY_P}

src_compile() {
	$(tc-getCC) ${CFLAGS} src/pdi2iso.c -o pdi2iso
}

src_install() {
	dobin pdi2iso
	dodoc CHANGELOG gpl.txt

}
