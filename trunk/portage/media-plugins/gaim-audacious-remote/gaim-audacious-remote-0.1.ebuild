# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit debug eutils

DESCRIPTION="control Audacious from within Gaim"
HOMEPAGE="http://www.nenolod.net/code/gaim-audacious-remote/"
SRC_URI="http://www.nenolod.net/code/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=net-im/gaim-2.0.0_beta1
	media-sound/audacious"


src_unpack() {
	unpack ${A}
	epatch ${FILESDIR}/${P}.patch
}

src_install() {
	make DESTDIR=${D} install || die
	dodoc AUTHORS ChangeLog INSTALL NEWS README VERSION
}
