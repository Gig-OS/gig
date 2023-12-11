# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="A Clash GUI based on tauri."
HOMEPAGE="https://github.com/keiko233/clash-nyanpasu"
SRC_URI="https://github.com/keiko233/clash-nyanpasu/releases/download/v${PV}/${PN}_${PV}_amd64.deb"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	!net-proxy/clash
	!net-proxy/clash-meta
	!net-proxy/clash-rs
	=net-libs/webkit-gtk-2.42.1-r410
	x11-libs/gtk+:3
	>=net-libs/libsoup-3.4.4
"
BDEPEND=""

S="${WORKDIR}"

QA_PREBUILT="
	/usr/bin/*
"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	domenu usr/share/applications/clash-nyanpasu.desktop
	insinto /
	doins -r *
	fperms +x /usr/bin/clash
	fperms +x /usr/bin/clash-nyanpasu
	fperms +x /usr/bin/clash-meta
	dosym -r /usr/lib64/libwebkit2gtk-4.1.so /usr/lib64/libwebkit2gtk-4.0.so.37
	dosym -r /usr/lib64/libjavascriptcoregtk-4.1.so /usr/lib64/libjavascriptcoregtk-4.0.so.18
	dosym -r /usr/lib64/libsoup-3.0.so /usr/lib64/libsoup-2.4.so.1
}

pkg_postinst() {
	chmod u+s /usr/bin/clash
	chmod u+s /usr/bin/clash-meta
	chmod u+s /usr/bin/clash-rs
}
