# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils wxwidgets

DESCRIPTION="A tool that allows you to create, manipulate and study graphs"
HOMEPAGE="http://graph.seul.org/"
SRC_URI="http://graph.seul.org/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="nls"

DEPEND=">=x11-libs/wxGTK-2.6.1
	nls? ( sys-devel/gettext )
	sys-devel/flex
	sys-devel/bison"

RDEPEND="${DEPEND}"

pkg_setup() {
	export WX_GTK_VER="2.6"
	need-wxwidgets gtk2
}

src_unpack() {
	unpack ${A}
	cd "${S}" || die
	epatch "${FILESDIR}"/sandbox.patch
}

src_compile() {
	econf $(use_enable nls) $(use_enable nls langdialog) --with-wx-config="${WX_CONFIG}"  || "econf failed"
	emake || die
}

src_install() {
	einstall DESTDIR="${D}" || "einstall failed"
	dodoc README TODO CREDITS FeatureLog
}
