# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: overlay lapis ebuild deposu Exp $

inherit eutils toolchain-funcs

DESCRIPTION="Browse and open files in your home directory from the Gnome panel."
HOMEPAGE="http://code.google.com/p/gnome-menu-file-browser-applet/"
SRC_URI="http://gnome-menu-file-browser-applet.googlecode.com/files/${P}.tar.gz"       

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.0
         >=gnome-base/gnome-vfs-2.0
         >=gnome-base/gnome-panel-2.0"

DEPEND="${RDEPEND}
         dev-util/pkgconfig
         >=dev-util/cmake-2.4"


src_compile() {
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_C_COMPILER=$(which $(tc-getCC))
		.
	emake || die "emake failed"
}


src_install() {
	emake DESTDIR=${D} PREFIX=/usr install
	dodoc COPYING NEWS README
}
