# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="a set of tools for interfacing IMDB in order to maintain archives of films."
HOMEPAGE="http://www.matthew.ath.cx/projects/imdb-tools/"
SRC_URI="http://www.matthew.ath.cx/projects/${PN}/${P}.tar.gz"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-misc/curl
	app-admin/realpath
	app-text/htmltidy"

DEPEND="app-text/docbook-sgml-utils"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/makefile.patch
}

src_compile() {
	emake -j1 PREFIX=/usr
}

src_install () {
	einstall PREFIX=/usr DESTDIR="${D}"
	dodoc INSTALL README changelog
}
