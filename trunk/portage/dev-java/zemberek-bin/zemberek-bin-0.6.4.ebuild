# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg-2

DESCRIPTION="Zemberek NLP library"
HOMEPAGE="http://zemberek.dev.java.net"
SRC_URI="https://zemberek.dev.java.net/files/documents/2681/28335/zemberek-${PV}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=virtual/jre-1.4
	 dev-java/xpp3"

DEPEND=""

S=${WORKDIR}

src_compile() {
	einfo "This is a binary package";
}

src_install() {
	java-pkg_newjar zemberek-${PV}.jar zemberek.jar
	dodoc lisanslar/*
	dodoc surumler.txt
}
