# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="improved improved screen locker - 'the ricing fork of i3lock'"
HOMEPAGE="https://github.com/PandorasFox/i3lock-color"

EGIT_REPO_URI="${HOMEPAGE}"
KEYWORDS=""

LICENSE="BSD"
SLOT="0"

DEPEND="
	dev-util/pkgconf
	x11-libs/libxcb
	dev-libs/libcdio
	media-libs/fontconfig
	dev-libs/libev
	x11-libs/libX11
	x11-libs/libxkbcommon
	media-libs/libjpeg-turbo
"
RDEPEND="${DEPEND}"

src_configure() {
	autoreconf -fiv
	econf
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}

pkg_postinst() {
	elog "Running i3lock-color:"
	elog "Simply invoke the 'i3lock' command. To get out of it, enter your password and press enter."
	elog "More imformation please check https://github.com/Raymo111/i3lock-color#running-i3lock-color"
}
