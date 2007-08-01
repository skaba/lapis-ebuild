# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="Beloote is a popular 32-card trick-taking game played in France."
HOMEPAGE="http://en.wikipedia.org/wiki/Belote"
SRC_URI="http://boby.joe.free.fr/dev/${PN}/files/${P}.tar.gz"
KEYWORDS="~x86 ~amd64"
IUSE=""
SLOT="0"

RDEPEND=">=x11-libs/gtk+-2.8"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

pkg_setup() {
	DOCS="README COPYING TODO ChangeLog"
}
