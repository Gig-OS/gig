# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The world’s most-loved password manager CLI"
HOMEPAGE="https://1password.com"
SRC_URI="
	amd64? ( https://cache.agilebits.com/dist/1P/op2/pkg/v${PV}/op_linux_amd64_v${PV}.zip )
	arm64? ( https://cache.agilebits.com/dist/1P/op2/pkg/v${PV}/op_linux_arm64_v${PV}.zip )
"

S=${WORKDIR}

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="amd64 arm64"

RESTRICT="strip test bindist"

RDEPEND="${DEPEND}
	acct-group/onepassword-cli
"
BDEPEND="
	app-arch/unzip
	acct-group/onepassword-cli
"

src_install() {
	chgrp onepassword-cli op
	dobin op
}

pkg_postinst() {
	chmod g+s /usr/bin/op
}
