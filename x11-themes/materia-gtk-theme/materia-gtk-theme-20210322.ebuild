# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Materia is a Material Design theme for GNOME/GTK based desktop environments."
HOMEPAGE="https://github.com/nana-4/materia-theme"
SRC_URI="https://github.com/nana-4/materia-theme/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
		x11-themes/gnome-themes-standard
		x11-themes/gtk-engines-murrine"
BDEPEND="net-libs/nodejs"

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
		S="${WORKDIR}/materia-theme-${PV}"
	fi
}
