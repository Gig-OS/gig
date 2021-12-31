# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="LookingGlass"
MY_PV="${PV//0_beta/B}"
MY_P="${MY_PN}-${MY_PV}"

inherit cmake git-r3 desktop

DESCRIPTION="A low latency KVM FrameRelay implementation for guests with VGA PCI Passthrough"
HOMEPAGE="https://looking-glass.hostfission.com
		https://github.com/gnif/LookingGlass/"
EGIT_REPO_URI="https://github.com/gnif/${MY_PN}"
EGIT_COMMIT=${MY_PV}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+X wayland debug"

RDEPEND="dev-libs/libconfig:0=
	dev-libs/nettle:=[gmp]
	media-libs/freetype:2
	media-libs/fontconfig:1.0
	virtual/glu
	X? (
		x11-libs/libX11
		x11-libs/libXfixes
		x11-libs/libXi
		x11-libs/libXpresent
		x11-libs/libXScrnSaver
	)
	wayland? (
		dev-libs/wayland
	)
	"
DEPEND="${RDEPEND}
	app-emulation/spice-protocol"
BDEPEND="virtual/pkgconfig"

CMAKE_USE_DIR="${S}"/client

src_configure() {
	if ! use X ; then
		local mycmakeargs+=(
			-DENABLE_X11=no
		)
	fi

	if ! use wayland ; then
		local mycmakeargs+=(
			-DENABLE_WAYLAND=no
		)
	fi

	cmake_src_configure
}

src_install() {
	einstalldocs

	dobin "${BUILD_DIR}"/looking-glass-client

	domenu	"${FILESDIR}"/looking-glass.desktop
}
