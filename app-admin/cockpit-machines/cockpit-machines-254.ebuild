# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{9..10})

inherit python-single-r1

DESCRIPTION="This is the Cockpit user interface for virtual machines"
HOMEPAGE="http://cockpit-project.org/"

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cockpit-project/cockpit-machines.git"
	KEYWORDS=""
	SRC_URI=""
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/cockpit-project/${PN}/releases/download/${PV}/${P}.tar.xz"
fi

LICENSE="LGPL-2.1"
SLOT="0"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="
"
DEPEND="
"

RDEPEND="${DEPEND}
	>=app-admin/cockpit-${PV}
	app-emulation/libvirt-dbus
	app-emulation/libvirt[firewalld,policykit]
	app-emulation/virt-manager[policykit]
	${PYTHON_DEPS}
"

S="${WORKDIR}/${PN}"

src_configure() {
	sed -i 's/RPMFILE=$(shell rpmspec/#RPMFILE=$(shell rpmspe/' Makefile || die
}
