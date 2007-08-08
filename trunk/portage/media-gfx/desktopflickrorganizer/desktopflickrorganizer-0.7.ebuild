# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 mono eutils

MY_PN="${PN}"
MY_PV="v${PV}"
MY_P="${MY_PN}-${MY_PV}"
DESCRIPTION="The application allows online/offline mode management of your photos."
HOMEPAGE="http://code.google.com/p/dfo/"
SRC_URI="http://dfo.googlecode.com/files/${MY_P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

RDEPEND=">=dev-lang/mono-1.1
		 >=dev-dotnet/gtk-sharp-2
		 >=dev-dotnet/gconf-sharp-2
		 >=x11-libs/gtk+-2.6.0
		 >=gnome-base/gconf-2"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_P}

src_compile() {
    einfo "/opt/desktopflickrorganizer"
}

src_install() {
	insinto /opt/desktopflickrorganizer
        doins DesktopFlickrOrganizer.exe
	doins run.sh
	doins license.txt

	insinto /opt/desktopflickrorganizer/icons
	doins icons/*
	
        insinto /opt/desktopflickrorganizer/lib
	doins lib/*
}


