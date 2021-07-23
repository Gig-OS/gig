# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{9..10})

inherit python-single-r1

DESCRIPTION="A Featureful File Browser for Cockpit."
HOMEPAGE="https://github.com/45Drives/cockpit-navigator"

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
	KEYWORDS=""
	SRC_URI=""
else
	KEYWORDS="~amd64"
	SRC_URI="${HOMEPAGE}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""
BDEPEND=""
RDEPEND="${DEPEND}
	sys-apps/cockpit
	net-misc/rsync
	app-arch/zip
	${PYTHON_DEPS}
"
