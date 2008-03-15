# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: overlay lapis ebuild deposu Exp $

inherit gnome2 cmake-utils

DESCRIPTION="Browse and open files in your home directory from the Gnome panel."
HOMEPAGE="http://code.google.com/p/gnome-menu-file-browser-applet/"
SRC_URI="http://gnome-menu-file-browser-applet.googlecode.com/files/${P}.tar.gz"       

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.12
         >=gnome-base/gnome-vfs-2.0
         >=gnome-base/gnome-panel-2.0
         >=gnome-base/libglade-2.0
         >=gnome-base/gnome-desktop-2.0"

DEPEND="${RDEPEND}
         dev-util/pkgconfig
         >=dev-util/cmake-2.4"

src_compile() {
	mycmakeargs="${mycmakeargs} -DCMAKE_INSTALL_GCONF_SCHEMA_DIR=/etc/gconf/schemas"
	cmake-utils_src_compile 
}

src_install() {
	export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL="1"
	cmake-utils_src_install
	unset GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL
	dodoc COPYING NEWS README
}
