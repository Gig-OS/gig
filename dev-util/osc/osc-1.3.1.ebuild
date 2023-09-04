# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="openSUSE Commander (osc) is a command-line interface
to the Open Build Service (OBS)."
HOMEPAGE="https://github.com/openSUSE/osc"
SRC_URI="https://github.com/openSUSE/osc/archive/refs/tags/1.3.1.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/cryptography
	dev-python/urllib3
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/argparse-manpage
	dev-python/cryptography
	dev-python/urllib3
"
