# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cmake-utils

DESCRIPTION="Zemberek-Pardus spell checker interface."
HOMEPAGE="http://www.pardus.org.tr/projeler/masaustu/zemberek-pardus"
SRC_URI="http://cekirdek.uludag.org.tr/~baris/zpspell/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="app-text/zemberek-server"

src_install() {
	cmake-utils_src_install
	dodoc AUTHORS README || die
}
