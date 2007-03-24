# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: overlay lapis ebuild deposu Exp $

inherit eutils versionator
MY_PV=$(replace_version_separator 3 '-' )
MY_P=${PN}-${MY_PV}
DESCRIPTION="GUI frontends to encode video"
HOMEPAGE="http://vive.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="dvd"

DEPEND=">=media-video/ffmpeg-0.4.9_p20051216
		  dvd? (>=media-video/vobcopy-0.5.14)"

RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_compile() {
	econf  $(use_enable dvd)  || die "econf failed"
	emake || die "emake failed"
}


src_install() {
	emake DESTDIR=${D} install || die
	dodoc AUTHORS README TODO COPYING NEWS
}
