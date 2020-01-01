# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )

inherit distutils-r1

DESCRIPTION="Sos is an extensible, portable, support data collection tool
primarily aimed at Linux distributions and other UNIX-like operating systems."
HOMEPAGE="https://github.com/sosreport/sos"
SRC_URI="https://github.com/sosreport/sos/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/pycodestyle-2.4.0
	>=dev-python/nose-1.3.7
	>=dev-python/coverage-4.0.3
	>=dev-python/sphinx-1.3.5
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
		mv sos-${PV} ${S}
	fi
}
