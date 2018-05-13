# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
MY_PV="${PV}-c"

DESCRIPTION="improved improved screen locker - 'the ricing fork of i3lock'"
HOMEPAGE="https://github.com/PandorasFox/i3lock-color"
SRC_URI="https://github.com/PandorasFox/i3lock-color/archive/$MY_PV.tar.gz"

LICENSE="None"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/pkgconfig
	x11-libs/libxcb
	dev-libs/libcdio
	media-libs/fontconfig
	dev-libs/libev
	x11-libs/libX11
	x11-libs/libxkbcommon
	media-libs/libjpeg-turbo
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}-c"

src_compile() {
	autoreconf -i
	econf
	emake
}

src_install() {
	emake DESTDIR="${D}" install
	pushd ${FILESDIR}
	dobin lock lock
	popd
}

pkg_postinst() {
	elog "How to use : lock"
	elog "If you want to change the color , just edit the /usr/bin/lock"
}
