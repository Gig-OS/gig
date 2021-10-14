# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

MY_PN="Majsoul_Plus"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A dedicated browser for Mahjong Majsoul, provides some proprietary features"
HOMEPAGE="https://github.com/MajsoulPlus/majsoul-plus"
SRC_URI=" x86? ( https://github.com/MajsoulPlus/majsoul-plus/releases/download/v${PV}/${MY_P}-linux-ia32.tar.gz -> ${MY_P}.tar.gz )
		amd64? ( https://github.com/MajsoulPlus/majsoul-plus/releases/download/v${PV}/${MY_P}-linux-x64.tar.gz -> ${MY_P}.tar.gz )"

LICENSE=""AGPL-3
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+xdg file-deletion"

DEPEND=""
RDEPEND="${DEPEND}
		x11-libs/gtk+:3
		x11-libs/libXScrnSaver
		dev-libs/nss
		xdg? ( x11-misc/xdg-utils )
		file-deletion? (
			app-misc/trash-cli
			kde-plasma/kde-cli-tools
		)"
BDEPEND=""

QA_PRESTRIPPED="
	/opt/majsoul-plus/majsoul-plus
	/opt/majsoul-plus/libGLESv2.so
	/opt/majsoul-plus/libffmpeg.so
	/opt/majsoul-plus/libEGL.so
	/opt/majsoul-plus/chrome-sandbox
	/opt/majsoul-plus/swiftshader/libEGL.so
	/opt/majsoul-plus/swiftshader/libGLESv2.so
	/opt/majsoul-plus/swiftshader/libvk_swiftshader.so
	"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	unpack ${MY_P}.tar.gz
	if use amd64 ; then
		mv "${WORKDIR}"/"${MY_P}"-linux-x64 "${WORKDIR}"/"${MY_P}"
	elif use x86 ; then
		mv "${WORKDIR}"/"${MY_P}"-linux-ia32 "${WORKDIR}"/"${MY_P}"
	fi
}

src_install() {
	insinto /opt/majsoul-plus
	doins -r .
	fperms +x /opt/majsoul-plus/majsoul-plus
	dosym -r /opt/majsoul-plus/majsoul-plus /usr/bin/majsoul-plus

	domenu "${FILESDIR}"/majsoul-plus.desktop
}
