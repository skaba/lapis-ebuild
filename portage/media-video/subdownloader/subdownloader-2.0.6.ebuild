# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils python fdo-mime

DESCRIPTION="GUI utility for making software releases on SourceForge"
HOMEPAGE="http://www.subdownloader.net/"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P/-/_}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/PyQt4
	|| ( dev-python/kaa-metadata dev-python/mmpython )"

src_unpack() {
	unpack ${A}
	cd "${S}" || die
	epatch ${FILESDIR}/${P}.patch
	rm -r modules/mmpython
}

src_install() {
	insinto $(python_get_sitedir)/subdownloader
	doins -r cli FileManagement gui languages modules __init__.py
	newbin run.py subdownloader
	doman subdownloader.1
	dodoc README ChangeLog
	doicon gui/images/subdownloader.png
	domenu subdownloader.desktop
}

pkg_postinst() {
	python_mod_optimize $(python_get_sitedir)/subdownloader
	fdo-mime_desktop_database_update
        fdo-mime_mime_database_update
}

pkg_postrm() {
	python_mod_cleanup $(python_get_sitedir)/subdownloader
	fdo-mime_desktop_database_update
        fdo-mime_mime_database_update
}
