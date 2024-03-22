# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

DESCRIPTION="THE MALI USERSPACE DRIVER (Mali DRIVER)"
HOMEPAGE="https://github.com/JeffyCN/mirrors/tree/libmali"
EGIT_REPO_URI="https://github.com/JeffyCN/mirrors.git"
EGIT_BRANCH="libmali"
EGIT_COMMIT="ab3d91e3df2ef1c487c2d8f69daea1729668e428"

LICENSE="non-free"
SLOT="0"
KEYWORDS="~arm64"
IUSE="gbm +dummy X wayland +valhall-g610 utgard-450 midgard-t86x bifrost-g52 bifrost-g31 +g6p0 g13p0 r7p0 r18p0 g2p0 g13p0 g2p0"

DEPEND="
	x11-libs/libdrm
	X? (
		x11-libs/libxcb
		x11-libs/libXdamage
		x11-libs/libXext
	)
	wayland? (
		dev-libs/wayland
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local emesonargs=( 
		-Dvendor-package=true
		-Dkhr-header=true
	)
	local eplatform=()
	use gbm		&& eplatform+=gbm,
	use X		&& eplatform+=x11,
	use wayland && eplatform+=wayland,
	use dummy	&& eplatform=dummy
	emesonargs+=( -Dplatform="${eplatform}" )
	use valhall-g610	&& emesonargs+=( -Dgpu=valhall-g610 )
	use utgard-450		&& emesonargs+=( -Dgpu=utgard-450 )
	use midgard-t86x	&& emesonargs+=( -Dgpu=midgard-t86x )
	use bifrost-g52		&& emesonargs+=( -Dgpu=bifrost-g52 )
	use bifrost-g31		&& emesonargs+=( -Dgpu=bifrost-g31 )
	use g6p0	&& emesonargs+=( -Dversion=g6p0 )
	use g13p0	&& emesonargs+=( -Dversion=g13p0 )
	use r7p0	&& emesonargs+=( -Dversion=r7p0 )
	use r18p0	&& emesonargs+=( -Dversion=r18p0 )
	use g2p0	&& emesonargs+=( -Dversion=g2p0 )
	meson_src_configure
}
