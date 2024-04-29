# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="CloudDrive - Unlocking the Unlimited Possibilities of Cloud Storage"
HOMEPAGE="https://github.com/cloud-fs/cloud-fs.github.io"
SRC_URI="
	amd64? ( https://github.com/cloud-fs/cloud-fs.github.io/releases/download/v${PV}/clouddrive-2-linux-x86_64-${PV}.tgz -> ${P}-x86_64.tar.gz )
	arm64? ( https://github.com/cloud-fs/cloud-fs.github.io/releases/download/v${PV}/clouddrive-2-linux-aarch64-${PV}.tgz -> ${P}-arm64.tar.gz )
"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
	sys-fs/fuse
"
RDEPEND="${DEPEND}"

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack "${A}"
	fi
	mv * "${PN}"-"${PV}"
}

src_install(){
	mkdir -p "${D}"/opt/clouddrive
	mv * "${D}"/opt/clouddrive

	insinto /usr/bin
	dobin "${FILESDIR}"/"${PN}"

	systemd_dounit "${FILESDIR}"/"${PN}".service
}
