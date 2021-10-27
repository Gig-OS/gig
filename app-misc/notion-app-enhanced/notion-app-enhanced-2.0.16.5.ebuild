# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop xdg-utils

MY_PV="$(ver_cut 1-3)-$(ver_cut 4)"

DESCRIPTION="Notion Desktop builds with Notion Enhancer for Windows, MacOS and Linux"
HOMEPAGE="https://github.com/notion-enhancer/notion-repackaged"
SRC_URI="amd64? ( https://github.com/notion-enhancer/notion-repackaged/releases/download/v${MY_PV}/notion-app-enhanced_${MY_PV}_amd64.deb )
		arm64? ( https://github.com/notion-enhancer/notion-repackaged/releases/download/v${MY_PV}/notion-app-enhanced_${MY_PV}_arm64.deb )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

S="${WORKDIR}"

DEPEND=""
RDEPEND="${DEPEND}
	app-arch/snappy
	dev-libs/nss
	dev-libs/re2
	dev-libs/libappindicator
	dev-libs/libevent
	dev-libs/libxslt
	media-libs/libvpx
	media-video/ffmpeg
	net-dns/c-ares
	net-libs/http-parser
	sys-libs/zlib[minizip]
	x11-libs/gtk+:3
	x11-libs/libnotify
	x11-libs/libXScrnSaver
	"
BDEPEND=""

src_prepare() {
	sed -i "s#MimeType=x-scheme-handler/notion;x-scheme-handler/notion;x-scheme-handler/notion;#MimeType=x-scheme-handler/notion;#" usr/share/applications/notion-app-enhanced.desktop
	default
}

src_install() {
	insinto /
	doins -r opt
	fperms +x '/opt/Notion Enhanced/notion-app-enhanced'
	dosym -r '/opt/Notion Enhanced/notion-app-enhanced' /usr/bin/notion-app-enhanced

	domenu usr/share/applications/notion-app-enhanced.desktop
	for size in 16 32 48 64 128 256 512; do
		doicon -s "${size}" usr/share/icons/hicolor/"${size}"x"${size}"/apps/notion-app-enhanced.png
	done
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}
