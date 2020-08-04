# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Scripts to aid in installing Arch Linux"
HOMEPAGE="https://projects.archlinux.org/arch-install-scripts.git"
SRC_URI="https://github.com/archlinux/arch-install-scripts/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
app-shells/bash
sys-apps/coreutils
sys-apps/pacman
sys-apps/util-linux
"
RDEPEND="${DEPEND}"
BDEPEND="
app-text/asciidoc
"

src_prepare() {
	sed -i 's/\/usr\/local/\/usr/g' Makefile || die
	default
}
