# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Modem Manager GUI is a simple GTK based graphical interface"
HOMEPAGE="https://sourceforge.net/projects/modem-manager-gui/"
SRC_URI="https://jaist.dl.sourceforge.net/project/modem-manager-gui/modem-manager-gui-0.0.20.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm64 ~amd64"
S="${WORKDIR}/${PN}"

DEPEND="
	app-text/po4a
	dev-util/itstool
	app-text/gtkspell:3
	x11-libs/libnotify
	dev-libs/libayatana-appindicator
	net-misc/ofono
"
RDEPEND="${DEPEND}"
BDEPEND=""
