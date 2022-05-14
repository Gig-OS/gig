# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg cmake

DESCRIPTION="Qt-based interface for Optimus Manager"
HOMEPAGE="https://github.com/Shatur/optimus-manager-qt"
SRC_URI="https://github.com/Shatur/optimus-manager-qt/releases/download/${PV}/${P}-source.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="plasma"
RESTRICT="test"

COMMON_DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtx11extras:5
	dev-qt/qtsvg:5
	dev-qt/qtdbus:5
	plasma? (
		kde-plasma/plasma-desktop:5
		kde-frameworks/knotifications:5
		kde-frameworks/kiconthemes:5
	)"

DEPEND="
	${COMMON_DEPEND}
	dev-qt/linguist-tools:5
	kde-frameworks/extra-cmake-modules
	x11-libs/libXrandr"

RDEPEND="
	${COMMON_DEPEND}
	>=x11-misc/optimus-manager-1.4"

src_configure() {
	if use plasma; then
		local mycmakeargs=(
			-DWITH_PLASMA=ON
		)
	fi
	cmake_src_configure
}
