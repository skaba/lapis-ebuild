# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_PV=${PV/./}
DESCRIPTION="A Tutorial and Presentation creation software"
HOMEPAGE="http://www.debugmode.com/wink/"
SRC_URI="http://mirror.kriebeltjesmarkt.com/${PN}/${PN}${MY_PV}.tar.gz"
LICENSE="Wink"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

RDEPEND="x86?   ( >=x11-libs/gtk+-2.4 )
	 amd64? ( >=app-emulation/emul-linux-x86-gtklibs-2.4 )"
DEPEND=""

pkg_setup() {
	has_multilib_profile && ABI="x86"
}

src_unpack() {
	unpack ${A}
	mkdir -p ${S}
	tar -zxf  installdata.tar.gz -C ${S}
}

src_install() {
	insinto /opt/${PN}
	doins -r *
	rm ${D}/opt/${PN}/*.txt
	rm -rf ${D}/opt/${PN}/Docs
	fperms 755 /opt/wink/wink
	dodoc *.txt
	insinto /usr/share/doc/${P}
	use doc && doins "Docs/Wink User Guide.pdf"
	exeinto /opt/bin
	doexe ${FILESDIR}/wink
}

pkg_postinst() {
	ewarn "If the NumLock key is switched on, hotkeys in Wink do not work under Linux."
	ewarn "So make sure to turn off the NumLock key while capturing."
}
