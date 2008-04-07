# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

FROM_LANG="Turkish"
TO_LANG="English"
DICT_PREFIX="dictd_www.freedict.de_"

inherit stardict

HOMEPAGE="http://www.stardict.org/download.php"

KEYWORDS="x86 ~amd64 ppc sparc"
IUSE=""

RDEPEND=">=app-dicts/stardict-2.4.2"
