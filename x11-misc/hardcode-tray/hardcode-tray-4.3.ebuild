# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
MY_PV=v${PV}

DESCRIPTION="Fixes Hardcoded tray icons in Linux"
HOMEPAGE="https://github.com/bilelmoussaoui/Hardcode-Tray"
SRC_URI="https://github.com/bilelmoussaoui/Hardcode-Tray/archive/${MY_PV}.tar.gz"

LICENSE="None"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/ninja
	dev-util/meson
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
	meson builddir --prefix=/usr
}

src_install() {
	DESTDIR="${D}" ninja -C builddir install
}
