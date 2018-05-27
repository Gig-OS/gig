# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
MY_PV=v${PV}
inherit systemd

DESCRIPTION="A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet."
HOMEPAGE="https://github.com/fatedier/frp"
SRC_URI="
	amd64?	( https://github.com/fatedier/frp/releases/download/${MY_PV}/${PN}_${PV}_linux_amd64.tar.gz )
	x86?	( https://github.com/fatedier/frp/releases/download/${MY_PV}/${PN}_${PV}_linux_386.tar.gz )
	arm?	( https://github.com/fatedier/frp/releases/download/${MY_PV}/${PN}_${PV}_linux_arm.tar.gz )
	mips?	( https://github.com/fatedier/frp/releases/download/${MY_PV}/${PN}_${PV}_linux_mips.tar.gz )
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~mips"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
	mv * ${PN}-${PV}
}

src_install() {
	cd ${S}
	dobin frpc frps

	insinto /etc/frp
	doins *.ini

	newinitd "${FILESDIR}/frps.initd" frps
	newinitd "${FILESDIR}/frpc.initd" frpc
	systemd_dounit ${FILESDIR}/frps.service
	systemd_dounit ${FILESDIR}/frpc.service
}

pkg_postinst() {
	elog "To enable/use Frp service :"
	elog "rc-update add frps default or rc-update add frpc default"
	elog "systemctl enable frps or systemctl enable frpc"
}
