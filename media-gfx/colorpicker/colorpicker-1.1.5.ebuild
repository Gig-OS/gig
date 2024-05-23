# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson vala xdg

DESCRIPTION="A color picker for elementaryOS."
HOMEPAGE="https://github.com/RonnyDo/ColorPicker"
SRC_URI="https://github.com/RonnyDo/ColorPicker/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/granite
	x11-libs/gtk+
"
RDEPEND="${DEPEND}"

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
	mv * "${P}"
}

src_configure() {
	vala_setup
	meson_src_configure
}
