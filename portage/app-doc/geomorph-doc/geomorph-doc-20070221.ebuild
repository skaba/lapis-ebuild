# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $



DESCRIPTION="GeoMorph Document"
HOMEPAGE="http://geomorph.sourceforge.net/frame_en.html"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-2"

DEPEND=""

S=${WORKDIR}

src_install() {
	dohtml -r ${P}/doc/*

}
