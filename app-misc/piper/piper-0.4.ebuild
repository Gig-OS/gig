# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit meson gnome2-utils

DESCRIPTION="GTK application to configure gaming devices"
HOMEPAGE="https://github.com/libratbag/piper"
SRC_URI="https://github.com/libratbag/piper/archive/${PV}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
dev-libs/libratbag
dev-python/python-evdev
dev-python/pycairo
dev-python/pygobject
dev-python/lxml
"
RDEPEND="${DEPEND}"
BDEPEND=""
