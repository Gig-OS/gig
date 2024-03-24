# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

DESCRIPTION="Fake cursor plane with regular drm plane."
HOMEPAGE="https://github.com/JeffyCN/drm-cursor"
EGIT_REPO_URI="https://github.com/JeffyCN/drm-cursor.git"

LICENSE="LGPL2"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	media-libs/mesa
"
RDEPEND="${DEPEND}"
BDEPEND=""
