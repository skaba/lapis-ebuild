# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="An implementation of the classic hearts card game for the GNOME desktop"
HOMEPAGE="http://www.jejik.com/hearts"
SRC_URI="http://www.jejik.com/files/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="=gnome-base/libgnome-2*
	=gnome-base/libgnomeui-2*
	=gnome-base/libglade-2*
	>=dev-lang/lua-5.0"

DEPEND="${RDEPEND}
	dev-util/intltool
	app-text/scrollkeeper
	app-text/gnome-doc-utils"

DOCS="AUTHORS ChangeLog COPYING COPYING-DOCS NEWS README TODO"
