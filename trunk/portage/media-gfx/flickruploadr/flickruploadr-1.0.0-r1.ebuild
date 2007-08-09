# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit distutils

MY_PN="FlickrUploadr"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="Little drag and drop Flickr uploader"
HOMEPAGE="http://micampe.it/things/flickruploadr"
SRC_URI="http://micampe.it/files/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""
DEPEND=""
S="${WORKDIR}/${MY_P}"

src_install() {
	distutils_src_install
	make_desktop_entry Uploadr "FlickrUploadr" "/usr/share/FlickrUploadr/flickr_logo.gif" Graphics 
}
