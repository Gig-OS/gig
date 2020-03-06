# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker desktop gnome2-utils xdg-utils

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
		opt/Tusk/libEGL.so
		opt/Tusk/libGLESv2.so
		opt/Tusk/tusk"

src_unpack() {
	unpack_deb "${A}"
}

src_install() {
	domenu ${S}/usr/share/applications/tusk.desktop

	doicon  ${S}/usr/share/icons/hicolor/0x0/apps/tusk.png

	insinto /
	doins -r opt
	fperms +x /opt/Tusk/tusk
	dosym /opt/Tusk/tusk /opt/bin/tusk
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
