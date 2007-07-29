# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils subversion

ESVN_REPO_URI="http://svn.pardus.org.tr/uludag/trunk/pardusman/"

DESCRIPTION="Pardus distribution media maker."
HOMEPAGE="http://svn.pardus.org.tr/uludag/trunk/pardusman/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-python/pykdeextensions"
RDEPEND="dev-python/PyQt
	 kde-base/pykde
	 dev-python/piksemel-svn
	 sys-fs/squashfs-tools
	 virtual/cdrtools
	 || ( kde-base/konsole kde-base/kdebase )"

src_unpack() {
	subversion_src_unpack
	epatch ${FILESDIR}/rmexeclink.patch
}

src_install() {
	distutils_src_install
	dosym /usr/kde/3.5/share/apps/pardusman/pardusman.py /usr/bin/pardusman
}
pkg_postinst() {
	distutils_pkg_postinst
	einfo "In order to use pardusman you need to get project files from"
	einfo "${HOMEPAGE}projects/"
}
