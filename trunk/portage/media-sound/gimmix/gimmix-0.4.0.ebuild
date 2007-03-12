# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic

DESCRIPTION="Gimmix is a graphical music player daemon (MPD) client written in C using GTK+2."
HOMEPAGE="http://priyank.one09.net/index.php?page=gimmix"
SRC_URI="http://gimmix.berlios.de/releases/${P}.tar.bz2"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
SLOT="0"
LICENSE="GPL-2"

DEPEND=">=x11-libs/gtk+-2.10
        >=gnome-base/libglade-2.6
	x11-libs/libnotify
	>=media-libs/libmpd-0.12.0
	>=media-libs/taglib-1.4"

## This fixes a bad bad bug.
replace-flags "-O*" "-O1"

src_install() {
	make DESTDIR=${D} install || die "make install failed"
}

