# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A fast and easy-to-use status bar"
HOMEPAGE="https://github.com/jaagr/polybar"
SRC_URI="https://github.com/jaagr/polybar/releases/download/${PV}/polybar.tar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	x11-libs/cairo
	x11-libs/libxcb
	x11-proto/xproto
	x11-libs/xcb-util-image
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-xrm
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_compile() {
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ${S}
}

src_install() {
	emake DESTDIR="${D}" install
}
