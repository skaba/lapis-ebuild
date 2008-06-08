# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils gnome2

DESCRIPTION="gdiff-ext is context menu extension for Nautilus to use diff tools."
HOMEPAGE="http://diff-ext.sourceforge.net"
SRC_URI="mirror://sourceforge/diff-ext/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.0
	>=gnome-base/nautilus-2.14
	>=gnome-base/gconf-2.14
	>=gnome-base/gnome-vfs-2.14"

DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig"

DOCS="AUTHORS ChangeLog"

src_unpack() {
	gnome2_src_unpack
	cd "${S}" || die
	epatch "${FILESDIR}"/clean-stray-chars.patch
	epatch "${FILESDIR}"/fix-nautilus-freeze.patch
	epatch "${FILESDIR}"/gnome-2.22-fix.patch #patch by Arun Raghavan <arunisgod@gmail.com>
	intltoolize --automake --copy --force || die "intltoolize failed"
	eautoreconf
}
