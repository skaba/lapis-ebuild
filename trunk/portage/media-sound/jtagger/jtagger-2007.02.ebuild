# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg-2

DESCRIPTION="Powerful MP3 tag and filename editor"
HOMEPAGE="http://dronten.googlepages.com/jtagger"
SRC_URI="http://dronten.googlepages.com/${P}.jar"

LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="source"

SLOT="0"

RDEPEND=">=virtual/jre-1.5
	 dev-java/jlayer
	 dev-java/jid3
	 >=dev-java/jgoodies-looks-2.0"

DEPEND="${RDEPEND}
	>=virtual/jdk-1.5
	app-arch/unzip
	source? ( app-arch/zip )"

src_unpack() {
	mkdir ${S}
	unzip -q ${DISTDIR}/${A} -d ${S}/src
	cd ${S}
	rm -rf src/com/jgoodies
	rm -rf src/javazoom
	rm -rf src/org
	rm -rf src/com/googlepages/dronten/jtagger/test
	for i in `find . -name '*.class' -print`; do rm $i; done
}

src_compile() {
	local classpath=$(java-pkg_getjars jid3,jlayer,jgoodies-looks-2.0)
	cd ${S}/src
	find . -name '*.java'  -print > sources.list
	ejavac -g -cp ${classpath} @sources.list
  	find . -name '*.class' -print > classes.list
  	find . -name '*.png' -print >> classes.list
  	touch myManifest
  	jar cmf myManifest ${PN}.jar @classes.list
}

src_install() {
	java-pkg_dojar src/${PN}.jar
	use source && java-pkg_dosrc src/
	java-pkg_dolauncher jtagger --main com.googlepages.dronten.jtagger.JTagger
}
