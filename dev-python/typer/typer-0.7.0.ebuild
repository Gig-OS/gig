# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

DESCRIPTION="Typer is a library for building CLI applications that
users will love using and developers will love creating."
HOMEPAGE="
	https://pypi.org/project/typer/
"
SRC_URI="https://github.com/tiangolo/typer/archive/refs/tags/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="
	dev-python/click
"

distutils_enable_tests pytest
