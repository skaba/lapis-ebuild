# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg-2 java-ant-2

ESVN_REPO_URI="http://zemberek.googlecode.com/svn/trunk/zemberek-server"

DESCRIPTION="A Turkish spell checker server based on Zemberek NLP library"
HOMEPAGE="http://code.google.com/p/zemberek/"
SRC_URI="http://zemberek.googlecode.com/files/zemberek-server-0.7_20070306.zip"

LICENSE="MPL"
SLOT="0"
KEYWORDS="~x86"
S=${WORKDIR}/${PN}

RDEPEND=">=virtual/jre-1.5
	 dev-java/zemberek
	 dev-java/dbus-java"

DEPEND="${RDEPEND}
	>=virtual/jdk-1.5
        dev-java/ant-core"

pkg_setup() {
	! built_with_use zemberek linguas_tr \
	&& die "Zemberek should be built with Turkish language support"
}

src_unpack() {
	unpack ${A}
	cd ${S}
	cd lib
	rm zemberek-tr-2.0.jar
	rm zemberek-cekirdek-2.0.jar
	rm dbus.jar
	rm unix.jar
	java-pkg_jarfrom zemberek zemberek2-cekirdek.jar
	java-pkg_jarfrom zemberek zemberek2-tr.jar
	java-pkg_jarfrom dbus-java dbus.jar
	java-pkg_jarfrom libmatthew-java unix.jar
	java-pkg_jarfrom libmatthew-java hexdump.jar
}

src_compile() {
        eant dist
}

src_install() {
	java-pkg_newjar dist/zemberek_server-0.7.jar zemberek-server.jar
	java-pkg_newjar dist/lib/mina-core-1.1pre.jar mina-core.jar
	java-pkg_newjar dist/lib/slf4j-nop.jar slf4j-nop.jar
	java-pkg_dolauncher zemberek-server \
		--java_args \
		"-Xverify:none -Xms12m -Xmx14m -DConfigFile=/etc/zemberek-server.ini" \
		--pre ${FILESDIR}/pre \
		--main net.zemberekserver.server.ZemberekServer
	doinitd ${FILESDIR}/zemberek-server
	insinto /etc/dbus-1/system.d
	doins dist/config/zemberek-server.conf
	insinto /etc
	newins config/conf.ini zemberek-server.ini
}
