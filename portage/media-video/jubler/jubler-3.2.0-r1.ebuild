# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg-2 java-utils-2 java-ant-2 versionator fdo-mime

MY_PV=$(replace_version_separator 3 '-' )
MY_PN=${PN/#j/J}
DESCRIPTION="Java subtitle editor"
HOMEPAGE="http://www.panayotis.com/jubler/"
SRC_URI="mirror://sourceforge/${PN}/Jubler-fullsrc-${MY_PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="nls spell kde"

RDEPEND=">=virtual/jre-1.5
	 spell?
	 (
	 	app-text/aspell
	 	dev-java/zemberek-bin
	 )"
        
DEPEND=">=virtual/jdk-1.5
	dev-java/ant-core
	app-text/docbook-sgml-utils
        nls? ( sys-devel/gettext)"

S=${WORKDIR}/${MY_PN}-${MY_PV}

src_unpack() {
        unpack ${A}
        cd ${S}
        chmod +x resources/ffmpeg-svn/configure
	epatch ${FILESDIR}/${P}.patch
	epatch ${FILESDIR}/${P}-fixsplit.patch
	use spell && java-pkg_getjars zemberek-bin > /dev/null
}

src_compile() {
	local anttasks_opt
	use nls && anttasks_opt="i18n"
	eant ${anttasks_opt} jar xdevelop || die "compile failed"
}

src_install() {
	java-pkg_newjar dist/Jubler.jar ${PN}.jar
        java-pkg_doso resources/ffdecode/libffdecode.so
        doicon resources/installers/linux/jubler.png
	newicon resources/installers/linux/subtitle-32.png subtitle.png
        java-pkg_dolauncher jubler --main com.panayotis.jubler.Main
        domenu resources/installers/linux/jubler.desktop
        doman resources/installers/linux/jubler.1
        insinto /usr/share/jubler/help
        doins dist/help/*
        if use kde; then
        	insinto /usr/share/mimelnk/application
        	doins resources/installers/linux/sub-*.desktop
        fi
}

#pkg_postinst() {
#	fdo-mime_desktop_database_update
#}

#pkg_postrm() {
#	fdo-mime_desktop_database_update
#}
