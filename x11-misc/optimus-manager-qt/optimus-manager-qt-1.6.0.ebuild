# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 xdg cmake

DESCRIPTION="Qt-based interface for Optimus Manager"
HOMEPAGE="https://github.com/Shatur95/optimus-manager-qt"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${P}.tar.gz"
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

src_unpack() {
	default
	EGIT_REPO_URI=$(grep  -A 1 'FetchContent_Declare(SingleApplication' ${S}/cmake/ExternalLibraries.cmake | grep GIT_REPOSITORY | awk -F ' ' '{print $2F}')
	EGIT_COMMIT=$(grep  -A 2 'FetchContent_Declare(SingleApplication' ${S}/cmake/ExternalLibraries.cmake  | grep GIT_TAG | awk -F ' ' '{print $2F}')
	git-r3_fetch ${EGIT_REPO_URI}
	git-r3_checkout ${EGIT_REPO_URI} "${S}"/_deps/singleapplication-src

	EGIT_REPO_URI=$(grep  -A 1 'FetchContent_Declare(CircleFlags' ${S}/cmake/ExternalLibraries.cmake | grep GIT_REPOSITORY | awk -F ' ' '{print $2F}')
	EGIT_COMMIT=$(grep  -A 2 'FetchContent_Declare(CircleFlags' ${S}/cmake/ExternalLibraries.cmake  | grep GIT_TAG | awk -F ' ' '{print $2F}')
	git-r3_fetch ${EGIT_REPO_URI}
	git-r3_checkout ${EGIT_REPO_URI} "${S}"/_deps/circleflags-src
}

src_configure() {
	if use plasma; then
		local mycmakeargs=(
			-DWITH_PLASMA=ON
			-DFETCHCONTENT_SOURCE_DIR_SINGLEAPPLICATION=../${P}/_deps/singleapplication-src
			-DFETCHCONTENT_SOURCE_DIR_CIRCLEFLAGS=../${P}/_deps/circleflags-src
		)
	else
		local mycmakeargs=(
			-DFETCHCONTENT_SOURCE_DIR_SINGLEAPPLICATION=../${P}/_deps/singleapplication-src
			-DFETCHCONTENT_SOURCE_DIR_CIRCLEFLAGS=../${P}/_deps/circleflags-src
		)

	fi
	cmake_src_configure
}
