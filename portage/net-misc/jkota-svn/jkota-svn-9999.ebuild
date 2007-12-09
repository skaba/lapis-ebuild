# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

WANT_ANT_TASKS="ant-nodeps"
inherit eutils java-pkg-2 java-ant-2 subversion

DESCRIPTION="ADSL kota kontrol programı"
HOMEPAGE="http://jkota.googlecode.com/"
ESVN_REPO_URI="http://jkota.googlecode.com/svn/trunk/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"
#EANT_ANT_TASKS="ant-nodeps svnant"

RDEPEND=">=virtual/jre-1.6
	dev-java/blowfishj
	dev-java/jtidy
	dev-java/httpunit
	!net-misc/jkota"

DEPEND=">=virtual/jdk-1.6
	dev-java/blowfishj
	dev-java/jtidy
	dev-java/httpunit
	dev-java/svnant"

src_compile() {
	ANT_TASKS="ant-nodeps svnant" eant jar
}

src_unpack() {
	subversion_src_unpack
	rm lib/*.jar || die
	java-pkg_jarfrom --into lib blowfishj,jtidy,httpunit
	epatch ${FILESDIR}/buildfix.patch
}

src_install() {
	java-pkg_dojar jkota.jar
	java-pkg_dolauncher jkota --main com.googlecode.jkota.swing.SwingADSLKota
	newicon favicon.png jkota.png
	make_desktop_entry jkota "JKota" jkota.png
}
