# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Extcalc scientific calculator based QT"
HOMEPAGE="http://extcalc-linux.sourceforge.net/"
SRC_URI="mirror://sourceforge/extcalc-linux/${P}.tar.gz"

KEYWORDS="~amd64 ~sparc ~x86"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

DEPEND=">=x11-libs/qt-3.3.0
	virtual/opengl"

RDEPEND="${DEPEND}"


src_compile() {
	econf || die "could not configure"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc "${WORKDIR}"/doc/*
}
