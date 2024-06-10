# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 qmake-utils desktop xdg

DESCRIPTION="An open-source, cross-platform standalone subtitle player"
HOMEPAGE="https://github.com/carsonip/Penguin-Subtitle-Player"
EGIT_REPO_URI="https://github.com/carsonip/Penguin-Subtitle-Player.git"
EGIT_COMMIT="v${PV}"
EGIT_SUBMODULES=(src/uchardet)

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	x11-themes/hicolor-icon-theme
	dev-qt/qtcore
"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake5 PREFIX=${D} PenguinSubtitlePlayer.pro
}
