# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A color picker for elementaryOS."
HOMEPAGE="https://github.com/RonnyDo/ColorPicker"
SRC_URI="https://github.com/RonnyDo/ColorPicker/archive/${PV}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/granite
	x11-libs/gtk+
	dev-util/meson
	dev-lang/vala
"
RDEPEND="${DEPEND}"

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
	mv * ${PN}-${PV}
}

src_configure() {
	cd ${S}
	export VALAC=`find /usr/bin/valac*`
	meson build && cd build
	meson configure --prefix=/usr
}

src_compile() {
	cd ${S}/build
	ninja
}

src_install() {
	cd ${S}/build
	DESTDIR="${D}" ninja install
}
