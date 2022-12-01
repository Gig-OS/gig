# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..11} )

inherit distutils-r1 git-r3

MPV=${PV/_/}
DESCRIPTION="Printrun is a 3D printing host software suite
which talks to your printer and handles the printing process"
HOMEPAGE="https://www.pronterface.com/"
EGIT_REPO_URI="https://github.com/kliment/Printrun"
EGIT_BRANCH="master"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/pyserial
	>=dev-python/wxpython-4.0.7-r2
	<=dev-python/pyglet-1.5.27
	dev-python/appdirs
	dev-python/numpy
	dev-python/pycairo
	dev-python/psutil
	media-gfx/cairosvg
	dev-python/pydbus
"
RDEPEND="${DEPEND}"
BDEPEND=""
