# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="Open Source Version of Allwinner PhoenixCard to
Dump, Unpack, Flash Allwinner IMG Files on Linux"
HOMEPAGE="https://github.com/YuzukiTsuru/OpenixCard"
EGIT_REPO_URI="https://github.com/YuzukiTsuru/OpenixCard"
EGIT_BRANCH="master"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/confuse
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	cmake .
}

src_compile() {
	emake
}

src_install() {
	if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]] ; then
		emake DESTDIR="${D}" install
	fi
	einstalldocs
}
