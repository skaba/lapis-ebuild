# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

WANT_ANT_TASKS="ant-nodeps"
inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Internet kota kontrol programı"
HOMEPAGE="http://jkota.googlecode.com/"
#SRC_URI="http://jkota.googlecode.com/files/${P}-src.zip"
SRC_URI="http://ebuild.linux-sevenler.org/distfiles/${P}-src.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"
S="${WORKDIR}"

RDEPEND=">=virtual/jre-1.6
	dev-java/blowfishj
	dev-java/jtidy
	>=dev-java/httpunit-1.6.2-r2"

DEPEND=">=virtual/jdk-1.6
	dev-java/blowfishj
	dev-java/jtidy
	dev-java/httpunit"

src_unpack() {
	unpack ${A}
	rm lib/*.jar || die
	java-pkg_jarfrom --into lib blowfishj,jtidy,httpunit
}

src_install() {
	java-pkg_dojar ${PN}.jar
	java-pkg_dolauncher ${PN} --main com.googlecode.jkota.swing.SwingKota
	newicon favicon.png ${PN}.png
	make_desktop_entry ${PN} "JKota" ${PN}.png
}
