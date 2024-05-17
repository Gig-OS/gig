# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="calamares settings for Gig OS"
HOMEPAGE="https://github.com/Gig-OS/calamares-settings-gig"
EGIT_REPO_URI="https://github.com/Gig-OS/calamares-settings-gig.git"

LICENSE="MIT"
SLOT="0"

RDEPEND="
	app-admin/calamares
	sys-fs/btrfs-progs
	sys-fs/dosfstools
	sys-fs/squashfs-tools[lzma]
"

src_install() {
	insinto /
	doins -r *
}
