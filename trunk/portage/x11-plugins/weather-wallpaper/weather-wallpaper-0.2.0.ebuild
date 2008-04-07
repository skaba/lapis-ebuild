# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: overlay lapis ebuild deposu Exp $

inherit eutils


DESCRIPTION="Weather Wallpaper - visit : http://www.nws.noaa.gov/tg/siteloc.shtml"
HOMEPAGE="http://mundogeek.net/weather-wallpaper/"
SRC_URI="http://mundogeek.net/repo/pool/feisty/all/${PN}_${PV}.orig.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.2.0
	dev-lang/python
	>=dev-python/pygtk-2.10
	media-gfx/inkscape
	media-gfx/imagemagick
	dev-python/pymetar"

RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}-${PV}.orig


src_install() {
	make DESTDIR="${D}" install || die "make install failed"
}
