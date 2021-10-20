# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{9..10})

inherit python-single-r1 git-r3

DESCRIPTION="A Featureful File Browser for Cockpit."
HOMEPAGE="https://github.com/45Drives/cockpit-navigator"

EGIT_REPO_URI="https://github.com/45Drives/cockpit-navigator"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""
BDEPEND=""
RDEPEND="${DEPEND}
	app-admin/cockpit
	net-misc/rsync
	app-arch/zip
	${PYTHON_DEPS}
"
