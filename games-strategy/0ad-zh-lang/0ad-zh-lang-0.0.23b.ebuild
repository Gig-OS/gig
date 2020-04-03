# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="chinese support for 0ad"
HOMEPAGE=""
SRC_URI="http://releases.wildfiregames.com/locales/zh-lang-${PV}.pyromod -> zh-lang-${PV}.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=games-strategy/0ad-0.0.23b_alpha
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack(){
	if [[ -n ${A} ]]; then
		S=${DISTDIR}
	fi
}

src_install(){
	insinto /usr/share/0ad/mods/public
	doins ${A}
}
