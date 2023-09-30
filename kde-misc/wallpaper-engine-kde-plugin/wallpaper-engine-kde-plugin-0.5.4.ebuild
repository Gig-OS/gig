# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="A KDE wallpaper plugin integrating Wallpaper Engine"
HOMEPAGE="https://github.com/catsout/wallpaper-engine-kde-plugin"
EGIT_REPO_URI="https://github.com/catsout/wallpaper-engine-kde-plugin.git"
EGIT_COMMIT="v${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-util/cmake
	dev-util/vulkan-headers
	kde-plasma/plasma-workspace
	media-plugins/gst-plugins-libav
	media-video/mpv
	dev-lang/python
	dev-python/websockets
	dev-qt/qtdeclarative:5
	dev-qt/qtwebsockets:5
	dev-qt/qtwebchannel:5
	app-arch/lz4
	media-libs/mesa[vulkan,video_cards_radeonsi]
"

RDEPEND="${DEPEND}"

src_prepare() {
	git submodule update --init
	eapply "${FILESDIR}/0.5.4-add-cstdio-to-fix-build.patch"
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
