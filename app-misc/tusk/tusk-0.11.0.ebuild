# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker gnome2-utils xdg-utils

DESCRIPTION="Refined Evernote desktop app"
HOMEPAGE="https://klauscfhq.github.io/tusk"
SRC_URI="
	amd64? ( https://github.com/klauscfhq/tusk/releases/download/v${PV}/tusk_${PV}_amd64.deb -> ${P}-amd64.deb )
	x86? ( https://github.com/klauscfhq/tusk/releases/download/v${PV}/tusk_${PV}_i386.deb -> ${P}-i386.deb )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}"

RDEPEND="
	>=gnome-base/gconf-2
	x11-libs/libnotify
	x11-libs/libXtst
	x11-libs/libXScrnSaver
	>=dev-libs/nss-3
	"

QA_PREBUILT="
		opt/Tusk/libffmpeg.so
		opt/Tusk/libnode.so
		opt/Tusk/tusk-app"

src_unpack() {
	unpack_deb "${A}"
}

src_install() {
	domenu "${S}/usr/share/applications/tusk-app.desktop"

	for size in 16 24 32 48 64 96 128 256 512; do
		doicon -s ${size} "${S}/usr/share/icons/hicolor/${size}x${size}/apps/tusk-app.png"
	done

	dodoc usr/share/doc/tusk-app/changelog.gz

	insinto /
	doins -r opt
	fperms +x /opt/Tusk/${PN}-app
	dosym /opt/Tusk/${PN}-app /opt/bin/${PN}-app
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	gnome2_icon_cache_update
}
