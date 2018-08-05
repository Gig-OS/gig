# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )

inherit distutils-r1

DESCRIPTION="A friendly wrapper around the Soundcloud API"
HOMEPAGE="https://github.com/soundcloud/soundcloud-python"
SRC_URI="https://github.com/${PN/-*}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${PYTHON_DEPEND}"
RDEPEND="${DEPEND}
	>=dev-python/fudge-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/simplejson-2.0[${PYTHON_USEDEP}]"
