# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/mozilla-firefox-bin/mozilla-firefox-bin-1.0.6-r2.ebuild,v 1.2 2005/08/11 20:21:37 flameeyes Exp $

inherit eutils mozilla-launcher multilib

DESCRIPTION="Flock Web Browser"
#SRC_URI="http://ftp.osuosl.org/pub/flock/releases/${PV}/flock-${PV}.2.en-US.linux-i686.tar.gz"
SRC_URI=http://erkan.linux-sevenler.org/download/flock/${PV}/flock-${PV}.0.tr-TR.linux-i686.tar.gz
HOMEPAGE="www.flocks.com"
RESTRICT="nostrip"

KEYWORDS="-* amd64 x86"
SLOT="0"
LICENSE="MPL-1.1 GPL-1"
IUSE=""

DEPEND="virtual/libc"
RDEPEND="virtual/x11
	x86? (
		>=x11-libs/gtk+-2.2
	)
	amd64? (
		>=app-emulation/emul-linux-x86-baselibs-1.0
		>=app-emulation/emul-linux-x86-gtklibs-1.0
	)
	>=www-client/mozilla-launcher-1.41"
S=${WORKDIR}/${PN}

pkg_setup() {
	# This is a binary x86 package => ABI=x86
	# Please keep this in future versions
	# Danny van Dyk  2005/03/26
	has_multilib_profile && ABI="x86"
}

src_install() {
	declare MOZILLA_FIVE_HOME=/opt/flock

	# Install flock in /opt
	dodir ${MOZILLA_FIVE_HOME%/*} /opt/bin
	mv ${WORKDIR}/flock ${D}${MOZILLA_FIVE_HOME}

	# Create /opt/bin/flock
	dosym ${MOZILLA_FIVE_HOME}/flock /opt/bin/flock
	
	# Install icon and .desktop for menu entry
        insinto /usr/share/pixmaps
        doins ${FILESDIR}/icon/flock-bin-icon.png
        insinto /usr/share/applications
        doins ${FILESDIR}/icon/flock-bin.desktop
}

pkg_preinst() {
	declare MOZILLA_FIVE_HOME=/opt/flock

	# Remove entire installed instance to prevent all kinds of
	# problems... see bug 44772 for example
	# I don't know if this extends to flock so I just let them
	rm -rf ${ROOT}${MOZILLA_FIVE_HOME}
}

pkg_postinst() {
	if use amd64; then
		echo
		einfo "NB: You just installed a 32-bit firefox"
	fi

	update_mozilla_launcher_symlinks
}

pkg_postrm() {
	update_mozilla_launcher_symlinks
}
