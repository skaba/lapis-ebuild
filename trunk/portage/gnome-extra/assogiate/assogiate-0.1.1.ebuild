# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-cpp/gnome-vfsmm/gnome-vfsmm-2.16.0.ebuild,v 1.9 2007/02/18 13:40:41 kloeri Exp $

inherit gnome2

DESCRIPTION="assoGiate is a MIME file types editor for GNOME."
HOMEPAGE="http://www.kdau.com/projects/assogiate/"
SRC_URI="http://www.kdau.com/files/$P.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.10.0
		     >=dev-cpp/glibmm-2.6.0
		     >=dev-cpp/gtkmm-2.6.0
                     >=dev-cpp/gnome-vfsmm-2.6.0
		     >=dev-cpp/libxmlpp-2.6.0"

DEPEND="${RDEPEND}
		   >=dev-util/pkgconfig-0.12.0
                   >=sys-devel/gettext-0.12.0
		   >=sys-devel/libtool-1.3.5"



src_unpack() {
	gnome2_src_unpack
}

src_compile() {
	gnome2_src_compile
}

src_install() {
	gnome2_src_install
}
