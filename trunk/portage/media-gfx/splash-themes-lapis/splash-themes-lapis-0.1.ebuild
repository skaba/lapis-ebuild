# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Lapis gensplash theme"
HOMEPAGE="http://www.linux-sevenler.org/"
SRC_URI="ftp://irfan.myftp.org/lapis-splash-screen-version-${PV}.tar.bz2"
IUSE=""
LICENSE="freedist"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND=">=media-gfx/splashutils-1.1.9.5"

src_install() {
	dodir /etc/splash/lapis
	cp -pR "${WORKDIR}"/lapis "${D}"/etc/splash
}
