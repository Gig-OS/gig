# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="An unidentifiable mechanism that helps you bypass GFW."
HOMEPAGE="https://trojan-gfw.github.io/trojan/"
SRC_URI="https://github.com/trojan-gfw/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/cmake
	dev-libs/boost
	dev-libs/openssl
	dev-db/mysql-connector-c
"
RDEPEND="${DEPEND}"

src_configure() {
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DSYSTEMD_SERVICE=ON ${S}
	emake
}

src_install() {
	emake DESTDIR="${D}" install

	newinitd "${FILESDIR}/trojan.initd" trojan
}

pkg_postinst(){
	elog "To use trojan , you need to edit the /etc/trojan/config.json"
	elog "OpenRC: rc-update add trojan"
	elog "Systemd: systemctl enable trojan"
}
