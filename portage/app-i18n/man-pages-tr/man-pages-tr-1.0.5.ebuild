# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A somewhat comprehensive collection of turkish Linux man pages"
HOMEPAGE="http://www.belgeler.org/"
SRC_URI="http://belnet.dl.sourceforge.net/sourceforge/belgeler/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc x86"
IUSE=""

RDEPEND=""
DEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i -e 's/MANDIR\ \=\ \/usr\/share\/man\/tr/MANDIR\ \=\ \$\(DESTDIR)\/usr\/share\/man\/tr/' Makefile
}

src_compile() {
	make || die
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc BENiOKU changelog copying copyright
}
