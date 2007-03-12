# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games gnome2-utils

DESCRIPTION="rewrite of Windows card game WUNO"
HOMEPAGE="http://sourceforge.net/projects/gnono/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=gnome-base/libgnomecanvas-2.0
	 >=gnome-base/libgnome-2.0
	 >=gnome-base/libgnomeui-2.0
	 >=gnome-base/libbonoboui-2.0
	 >=x11-libs/gtk+-2.6"

DEPEND="${RDEPEND}"

src_compile() {
	egamesconf || die
	emake || die "emake failed"
}

src_install() {
	einstall || die
	dodoc INSTALL NEWS README TODO
	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
