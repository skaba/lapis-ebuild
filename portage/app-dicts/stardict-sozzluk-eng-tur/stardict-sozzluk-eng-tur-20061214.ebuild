# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
 
FROM_LANG="English"
TO_LANG="Turkish"
 
inherit stardict
 
HOMEPAGE="http://www.sozzluk.com/stardict/"
SRC_URI="http://ebuild.linux-sevenler.org/distfiles/stardict-english_turkish.tar.bz2"
 
KEYWORDS="x86 ~amd64 ppc sparc"
IUSE=""
 
RDEPEND=">=app-dicts/stardict-2.4.2"
S=${WORKDIR}/stardict-english_turkish
