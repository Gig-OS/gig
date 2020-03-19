# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg

DESCRIPTION="A sophisticated software modeler for agile and concise modeling"
HOMEPAGE="http://staruml.io/"
SRC_URI="
	amd64? ( http://staruml.io/download/releases/${P}.AppImage )
	x86? ( http://staruml.io/download/releases/${P}-i386.AppImage -> ${P}.AppImage )
"

LICENSE="staruml"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror strip"

DEPEND="gnome-base/gconf
		x11-libs/libXScrnSaver
		x11-libs/libXtst
		dev-libs/nss
		media-libs/alsa-lib
		x11-libs/gtk+:2
"
RDEPEND="${DEPEND}"

QA_PREBUILT="
opt/StarUML-3.2.2/libEGL.so
opt/StarUML-3.2.2/libGLESv2.so
opt/StarUML-3.2.2/swiftshader/libvk_swiftshader.so
opt/StarUML-3.2.2/swiftshader/libEGL.so
opt/StarUML-3.2.2/swiftshader/libGLESv2.so
opt/StarUML-3.2.2/libffmpeg.so
opt/StarUML-3.2.2/staruml"

S=${WORKDIR}/squashfs-root

src_unpack() {
	cp "${DISTDIR}/${P}".AppImage "${P}".AppImage
	chmod u+x ${P}.AppImage
	./${P}.AppImage --appimage-extract || die "extract appimage failed."
}

src_install() {
	dodir /opt/${P}

	sed -i 's/AppRun/staruml/g' staruml.desktop
	domenu staruml.desktop

	for size in 16 32 48 128 512; do
		doicon -s ${size} usr/share/icons/hicolor/${size}x${size}/apps/staruml.png
	done

	insinto /opt/${P}
	rm -rf usr
	rm staruml.png
	doins -r *

	fperms +x /opt/${P}/AppRun
	fperms +x /opt/${P}/staruml
	dosym ../${P}/staruml /opt/bin/staruml
}
