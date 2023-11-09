# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="bloop is ChatGPT for your code."
HOMEPAGE="https://github.com/BloopAI/bloop"
SRC_URI="https://github.com/BloopAI/${PN}/releases/download/v${PV}/${PN}_${PV}_amd64.deb"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	net-libs/webkit-gtk
	x11-libs/gtk+:3
"
BDEPEND=""

QA_PREBUILT="
	/usr/bin/*
	/usr/lib/bloop/dylibs/libonnxruntime.so
"

S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	domenu usr/share/applications/bloop.desktop
	insinto /
	doins -r *
	fperms +x /usr/bin/bloop
	fperms +x /usr/bin/qdrant
	fperms +x /usr/lib/bloop/dylibs/libonnxruntime.so
}

pkg_postinst() {
	chmod u+s /usr/bin/qdrant
}
