# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Enable/disable NTFS write support with a simple click"
HOMEPAGE="http://flomertens.free.fr/ntfs-config/"
SRC_URI="http://flomertens.free.fr/ntfs-config/download/source/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="nls"
DEPEND="sys-fs/udev
	nls? ( sys-devel/gettext )
	>=gnome-base/libglade-2.0
	>=x11-libs/gtk+-2.6"

RDEPEND="${DEPEND}
	sys-fs/ntfs3g"

src_compile() {
	econf  $(use_enable nls)  || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog INSTALL NEWS README TODO
}


