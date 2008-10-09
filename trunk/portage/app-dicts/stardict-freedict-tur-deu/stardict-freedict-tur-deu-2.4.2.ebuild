# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

FROM_LANG="Turkish"
TO_LANG="German"
DICT_PREFIX="freedict-"

inherit stardict

HOMEPAGE="http://stardict.sourceforge.net/"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=app-dicts/stardict-2.4.2"
