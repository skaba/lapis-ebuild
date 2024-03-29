# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Console version of Stardict program"
HOMEPAGE="http://sdcv.sourceforge.net/"
SRC_URI="mirror://sourceforge/sdcv/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="nls"

DEPEND="nls? ( sys-devel/gettext )
	sys-libs/zlib
	sys-libs/readline
	>=dev-libs/glib-2.6.1"

src_compile() {
	econf $(use_enable nls) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc AUTHORS BUGS ChangeLog INSTALL NEWS README TODO
}
