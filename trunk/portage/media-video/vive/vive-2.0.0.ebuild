# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: overlay lapis ebuild deposu Exp $

inherit eutils gnome2
DESCRIPTION="GUI frontends to encode video"
HOMEPAGE="http://vive.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="dvd"

DEPEND=">=media-video/ffmpeg-0.4.9_p20051216
		  dvd? (>=media-video/vobcopy-0.5.14)"

RDEPEND="${DEPEND}"

G2CONF="$(use_enable dvd)"
DOCS="AUTHORS README TODO COPYING NEWS"
