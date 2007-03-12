# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Enable/disable NTFS write support with a simple click"
HOMEPAGE="http://flomertens.free.fr/ntfs-config/"
SRC_URI="http://flomertens.free.fr/${PN}/download/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="nls"
RESTRICT="nomirror"
DEPEND="
        nls? ( sys-devel/gettext )
        >=sys-apps/hal-0.5.2
	>=gnome-base/libglade-2.0
        >=x11-libs/gtk+-2.6"
RDEPEND="${DEPEND}
        sys-fs/ntfs3g"

src_compile() {
	econf  $(use_enable nls)  || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install || die
	dodoc AUTHORS COPYING ChangeLog INSTALL NEWS README TODO
}


