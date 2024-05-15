# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="A KDE wallpaper plugin integrating Wallpaper Engine"
HOMEPAGE="https://github.com/catsout/wallpaper-engine-kde-plugin"
EGIT_REPO_URI="https://github.com/catsout/wallpaper-engine-kde-plugin.git"
EGIT_BRANCH="qt6"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-util/vulkan-headers
	kde-plasma/plasma-workspace
	media-plugins/gst-plugins-libav
	media-video/mpv[vulkan]
	dev-python/websockets
	dev-qt/qtdeclarative:6
	dev-qt/qtwebsockets:6
	dev-qt/qtwebchannel:6
	app-arch/lz4
	media-libs/mesa[vulkan]
"

RDEPEND="${DEPEND}"

src_prepare() {
	git submodule update --init
	cmake_src_prepare
	default
}

src_configure() {
	local mycmakeargs=(
		-DUSE_PLASMAPKG=OFF
		-DBUILD_SHARED_LIBS=OFF
	)
	cmake_src_configure
}
