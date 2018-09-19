# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="An unidentifiable mechanism that helps you bypass GFW"
HOMEPAGE="https://github.com/trojan-gfw/trojan"
SRC_URI="https://github.com/trojan-gfw/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"
IUSE="mysql"

DEPEND="
	>=dev-libs/boost-1.54.0:=
	>=dev-libs/openssl-1.0.2:=
	mysql? ( dev-db/mysql-connector-c:= )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_MYSQL=$(usex mysql)
		-DSYSTEMD_SERVICE=ON
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	newinitd "${FILESDIR}/trojan.initd" trojan
}
