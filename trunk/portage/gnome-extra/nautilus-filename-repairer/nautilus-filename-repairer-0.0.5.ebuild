# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="A nautilus extension which can repair a filename that has invalid encoding"
HOMEPAGE="http://repairer.kldp.net/"
SRC_URI="http://kldp.net/frs/download.php/4595/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=x11-libs/gtk+-2.6
	>=gnome-base/nautilus-2.6
	>=gnome-base/gnome-vfs-2.6"

DEPEND="dev-util/intltool
	dev-util/pkgconfig
	${RDEPEND}"

DOCS="AUTHORS ChangeLog README INSTALL"
