# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

inherit gnome2

DESCRIPTION="assoGiate is a MIME file types editor for GNOME."
HOMEPAGE="http://www.kdau.com/projects/gelemental/"
SRC_URI="http://www.kdau.com/files/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc debug"

RDEPEND=">=dev-cpp/glibmm-2.6.0
	 >=dev-cpp/gtkmm-2.6.0
	 x11-libs/pango
	 sys-devel/gettext"

DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.12.0
	>=sys-devel/gettext-0.12.0
	>=sys-devel/libtool-1.3.5
	>=dev-util/intltool-0.35.0
	doc? ( app-doc/doxygen )"

G2CONF="$(use_enable debug) $(use_enable doc api-docs)"
DOCS="README TODO TRANSLATORS NEWS NEWS-GPeriodic AUTHORS ChangeLog COPYING COPYING.DATA INSTALL"
