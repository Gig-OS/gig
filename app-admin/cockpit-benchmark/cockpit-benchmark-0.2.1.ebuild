# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{9..10})

inherit python-single-r1

DESCRIPTION="A Storage Benchmark Utility for Cockpit."
HOMEPAGE="https://github.com/45Drives/cockpit-benchmark"

SRC_URI="https://github.com/45Drives/cockpit-benchmark/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""
BDEPEND=""
RDEPEND="${DEPEND}
	app-admin/cockpit
	sys-block/fio
	${PYTHON_DEPS}
"
