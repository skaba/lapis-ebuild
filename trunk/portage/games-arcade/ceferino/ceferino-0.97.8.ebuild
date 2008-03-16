# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A fun game similar to super pang developed using the SDL library."
HOMEPAGE="http://www.losersjuegos.com.ar/juegos/ceferino/ceferino.php"
SRC_URI="http://www.losersjuegos.com.ar/juegos/ceferino/descargas/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND="media-libs/libsdl
	media-libs/sdl-image
	media-libs/sdl-mixer
	sys-devel/gettext"

RDEPEND="${DEPEND}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS README
}
