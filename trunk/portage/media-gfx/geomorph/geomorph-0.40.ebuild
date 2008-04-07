# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils


DESCRIPTION="Geomorph is a height field generator and editor for Linux."
HOMEPAGE="http://geomorph.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc povray"

DEPEND=">=x11-libs/gtk+-2.4
	>=virtual/opengl-6.0
	doc? ( app-doc/geomorph-doc )"

RDEPEND="${DEPEND}
	poyrav? ( media-gfx/povray )"

src_compile() {
	econf || die "configure failed"
	emake || die "make failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
