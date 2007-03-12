# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg-2 versionator

MY_PV=$(delete_version_separator 2 )
MY_PV="${MY_PV}-2004-09-27"
DESCRIPTION="Blommers IT java HTTP Server Library"
HOMEPAGE="http://www.blommers-it.nl/libhttpd/"
SRC_URI="http://www.blommers-it.nl/libhttpd/downloads/v${MY_PV}-src.zip
	 doc? ( http://www.blommers-it.nl/libhttpd/downloads/v${MY_PV}-httpd-doc.zip )"

LICENSE="BlommersIT"
KEYWORDS="~x86"
IUSE="doc source"

SLOT="0"

RDEPEND=">=virtual/jre-1.4"
DEPEND=">=virtual/jdk-1.4
	app-arch/unzip
	source? ( app-arch/zip )"

S="${WORKDIR}"

src_unpack() {
	unzip -q ${DISTDIR}/v${MY_PV}-src.zip -d src
	use doc && unzip -q ${DISTDIR}/v${MY_PV}-httpd-doc.zip -d doc
}

src_compile() {
	cd ${S}/src/src
	for i in `find . -name '*.java' -print`; do echo "Compiling $i"; ejavac $i; done
  	find . -name '*.class' -print > classes.list
  	touch myManifest
  	jar cmf myManifest ${PN}.jar @classes.list
}

src_install() {
	java-pkg_dojar src/src/${PN}.jar
	dodoc src/src/com/blommersit/httpd/doc-files/*
	use doc && java-pkg_dohtml -r doc/
	use source && java-pkg_dosrc src/src/*
}
