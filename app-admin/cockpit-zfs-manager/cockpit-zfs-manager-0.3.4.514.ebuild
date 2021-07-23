# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Cockpit ZFS Manager is an interactive ZFS on Linux admin package for Cockpit."
HOMEPAGE="https://github.com/optimans/cockpit-zfs-manager"

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
	KEYWORDS=""
	SRC_URI=""
else
	KEYWORDS="~amd64"
	SRC_URI="${HOMEPAGE}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="LGPL-3"
SLOT="0"

DEPEND=""
BDEPEND=""
RDEPEND="${DEPEND}
	>=sys-apps/cockpit-201
	>=sys-fs/zfs-0.8
"

src_install() {
	insinto /usr/share/cockpit
	doins -r zfs
}
