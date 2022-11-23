# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

DESCRIPTION="This effect rounds the corners of your windows and adds 
an outline around them without much affecting the performance of the KDE Plasma desktop"
HOMEPAGE="This effect rounds the corners of your windows and adds an outline around them without much affecting the performance of the KDE Plasma desktop"
SRC_URI="https://github.com/matinlotfali/KDE-Rounded-Corners/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	kde-plasma/plasma-meta
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	default
	S="${WORKDIR}/KDE-Rounded-Corners-${PV}"
}
