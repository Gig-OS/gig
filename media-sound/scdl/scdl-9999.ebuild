# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )

inherit distutils-r1

DESCRIPTION="Soundcloud Music Downloader"
HOMEPAGE="https://github.com/flyingrub/scdl"

if [[ ${PV} != 9999 ]] ; then
	MY_PV="${PV/_beta/b}"
	MY_P="${PN}-${MY_PV}"
	SRC_URI="https://github.com/flyingrub/${PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_P}"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/flyingrub/scdl.git"
fi

LICENSE="GPLv2+"
SLOT="0"
IUSE=""

DEPEND="${PYTHON_DEPEND}"
RDEPEND="${DEPEND}
	dev-python/clint[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]
	dev-python/soundcloud-python[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]
	dev-python/wget[${PYTHON_USEDEP}]
	>=media-libs/mutagen-1.32[${PYTHON_USEDEP}]
	!!media-sound/soundcloud-dl"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_install() {
	distutils-r1_src_install

	dodoc config/${PN}.cfg
}
