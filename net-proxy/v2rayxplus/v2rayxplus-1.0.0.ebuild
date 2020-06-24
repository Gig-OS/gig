# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop systemd xdg

DESCRIPTION="A v2ray GUI client written in GO"
HOMEPAGE="https://gitlab.com/xiayesuifeng/v2rayxplus"
SRC_URI="https://gitlab.com/xiayesuifeng/v2rayxplus/-/jobs/artifacts/${PV}/download?job=run-build -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtconcurrent:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	net-firewall/iptables
"
RDEPEND="
	|| ( net-proxy/v2ray net-proxy/v2ray-bin )
	${DEPEND}
"
BDEPEND=""

QA_PRESTRIPPED="usr/bin/v2rayxplus"

S="${WORKDIR}/build"

src_install() {
	dobin v2rayxplus

	domenu "${FILESDIR}"/v2rayxplus.desktop
	doicon "${FILESDIR}"/v2rayxplus.svg
	systemd_dounit "${FILESDIR}"/v2rayxplus.service
}
