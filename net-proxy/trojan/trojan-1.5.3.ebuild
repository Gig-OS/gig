# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="An unidentifiable mechanism that helps you bypass GFW."
HOMEPAGE="https://trojan-gfw.github.io/trojan/"
SRC_URI="https://github.com/trojan-gfw/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="alpha amd64 x86 arm arm64 hppa mips ppc ppc64 s390 sh sparc"
IUSE="systemd mysql"

DEPEND="
	dev-util/cmake
	dev-libs/boost
	dev-libs/openssl
	mysql? ( dev-db/mysql-connector-c )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_MYSQL=$(usex mysql)
		-DSYSTEMD_SERVICE=$(usex systemd)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	newinitd "${FILESDIR}/trojan.initd" trojan
}

pkg_postinst(){
	elog "To use trojan, you need to edit the /etc/trojan/config.json"
	elog "OpenRC: rc-update add trojan"
	elog "Systemd: systemctl enable trojan"
}
