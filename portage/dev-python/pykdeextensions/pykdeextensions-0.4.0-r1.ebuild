# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

SRC_URI="http://www.simonzone.com/software/pykdeextensions/${P}.tar.gz"
DESCRIPTION="Python XML API based on the iksemel library."
HOMEPAGE="http://www.simonzone.com/software/pykdeextensions/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RDEPEND=""

src_unpack() {
	unpack ${A}
	epatch "${FILESDIR}"/pykdedist-compile-option.patch
	epatch "${FILESDIR}"/fix-moduledir.diff
	epatch "${FILESDIR}"/paths.patch
}
