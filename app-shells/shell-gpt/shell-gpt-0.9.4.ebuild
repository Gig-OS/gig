# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

DESCRIPTION="A command-line productivity tool powered by OpenAI's GPT models."
HOMEPAGE="https://github.com/TheR1D/shell_gpt"
SRC_URI="https://github.com/TheR1D/shell_gpt/archive/refs/tags/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/requests
	dev-python/click
	dev-python/rich
	dev-python/distro
	dev-python/typer
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
		S="${WORKDIR}/shell_gpt-${PV}"
	fi
}

