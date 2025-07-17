# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

MY_PN="FlClash"
PN_NOBIN="${PN%-bin}"
DESCRIPTION="A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free"
HOMEPAGE="https://github.com/chen08209/FlClash"
SRC_URI="
	amd64? ( ${HOMEPAGE}/releases/download/v${PV}/${MY_PN}-${PV}-linux-amd64.deb -> ${P}-amd64.deb )
	arm64? ( ${HOMEPAGE}/releases/download/v${PV}/${MY_PN}-${PV}-linux-arm64.deb -> ${P}-arm64.deb )
"
S="${WORKDIR}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"
RESTRICT="mirror bindist"

RDEPEND="
	dev-libs/libayatana-appindicator
	dev-libs/keybinder
	x11-apps/xmessage
	x11-libs/libX11
	x11-libs/libXmu
"
BDEPEND="app-arch/dpkg"

QA_PREBUILT="usr/lib/${PN_NOBIN}/*"

src_prepare() {
	default

	# Modify .desktop file
	sed -i \
		-e "s:Exec=${MY_PN}:Exec=${PN_NOBIN}:g" \
		-e "/^Name=/a Categories=Network;" \
		"${S}/usr/share/applications/${MY_PN}.desktop" || die
}

src_install() {
	# 安装启动脚本
	newbin "${FILESDIR}/flclash.sh" flclash

	# 安装主程序文件（保留权限）
	dodir /usr/lib/flclash
	cp -pPR "${S}/usr/share/FlClash/"* "${ED}/usr/lib/flclash/" || die

	# 安装桌面文件和图标
	domenu "${S}/usr/share/applications/FlClash.desktop"
	doicon -s 128 "${S}/usr/share/icons/hicolor/128x128/apps/FlClash.png"
	doicon -s 256 "${S}/usr/share/icons/hicolor/256x256/apps/FlClash.png"
}
