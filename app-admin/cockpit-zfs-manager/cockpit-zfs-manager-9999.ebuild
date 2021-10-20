# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Cockpit ZFS Manager is an interactive ZFS on Linux admin package for Cockpit."
HOMEPAGE="https://github.com/optimans/cockpit-zfs-manager"
EGIT_REPO_URI="https://github.com/optimans/cockpit-zfs-manager"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""

DEPEND=""
BDEPEND=""
RDEPEND="${DEPEND}
	>=app-admin/cockpit-201
	>=sys-fs/zfs-0.8
"

src_install() {
	insinto /usr/share/cockpit
	doins -r zfs
}
