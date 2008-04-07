# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs

DESCRIPTION="Zemberek-Pardus spell checker interface."
HOMEPAGE="http://www.pardus.org.tr/projeler/masaustu/zemberek-pardus"
SRC_URI="http://cekirdek.uludag.org.tr/~baris/zpspell/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-util/cmake"
RDEPEND=">app-text/zemberek-server-0.6"

src_compile() {
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_C_COMPILER=$(which $(tc-getCC))
		.
	emake
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
	dodoc AUTHORS README
}
