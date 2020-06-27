# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod

DESCRIPTION="Zenpower is Linux kernel driver for reading temperature for AMD Zen family CPUs"
HOMEPAGE="https://github.com/ocerman/zenpower"
SRC_URI="https://github.com/ocerman/zenpower/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

BUILD_TARGETS="modules"
MODULE_NAMES="zenpower(drivers/hwmon:${S})"

src_install() {
	linux-mod_src_install
}
