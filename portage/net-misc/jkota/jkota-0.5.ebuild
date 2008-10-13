# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

WANT_ANT_TASKS="ant-nodeps"
inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Internet kota kontrol programı"
HOMEPAGE="http://jkota.googlecode.com/"
SRC_URI="http://jkota.googlecode.com/files/${P}-src.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/${P}-src"

COMMON_DEPEND="dev-java/blowfishj
	>=dev-java/httpunit-1.6.2-r2
	dev-java/jcommon:1.0
	dev-java/jfreechart:1.0"

RDEPEND=">=virtual/jre-1.6
	${COMMON_DEPEND}"

DEPEND=">=virtual/jdk-1.6
	${COMMON_DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	rm lib/*.jar || die
	java-pkg_jarfrom --into lib blowfishj,httpunit,jcommon-1.0
	java-pkg_jarfrom --into lib jfreechart-1.0 jfreechart.jar
}

src_install() {
	java-pkg_dojar ${PN}.jar
	java-pkg_dolauncher ${PN} --main com.googlecode.jkota.swing.SwingKota
	newicon favicon.png ${PN}.png
	make_desktop_entry ${PN} "JKota" ${PN}.png
}
