# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Chinese Fonts and Translations For 0ad"
HOMEPAGE="https://play0ad.com"
SRC_URI="http://releases.wildfiregames.com/locales/zh-lang-${PV}.pyromod -> zh-lang-${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"

DEPEND="
	>=games-strategy/0ad-0.0.26_alpha-r1
"
RDEPEND="${DEPEND}"

src_unpack(){
	if [[ -n ${A} ]]; then
		S=${DISTDIR}
	fi
}

src_install(){
	insinto /usr/share/0ad/mods/public
	doins ${A}
}
