# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1 systemd

DESCRIPTION="Management utility to handle GPU switching for Optimus laptops"
HOMEPAGE="https://github.com/Askannz/optimus-manager"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
else
	SRC_URI="https://github.com/Askannz/optimus-manager/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-python/dbus-python[${PYTHON_USEDEP}]
	sys-apps/pciutils
	x11-apps/xrandr
	x11-apps/mesa-progs
"
RDEPEND="
	${DEPEND}
	"
BDEPEND="${PYTHON_DEPS}"

src_prepare() {
	sed -i "s#/sbin#/usr/bin#g" "${S}"/login_managers/sddm/20-"${PN}".conf || die
	sed -i "s#/sbin#/usr/bin#g" "${S}"/login_managers/lightdm/20-"${PN}".conf || die

	default
}

src_install() {
	# systemd
	systemd_dounit systemd/${PN}.service
	insinto /usr/$(get_libdir)/systemd/logind.conf.d
	doins systemd/logind/10-${PN}.conf
	insinto /usr/$(get_libdir)/systemd/system-sleep
	doins systemd/suspend/${PN}.py
	fperms 755 /usr/$(get_libdir)/systemd/system-sleep/${PN}.py

	# modules
	insinto /lib/modprobe.d
	doins modules/${PN}.conf

	insinto /var/lib/${PN}
	doins var/*

	# config
	insinto /etc/${PN}
	doins config/*
	fperms 755 /etc/"${PN}"/{nvidia-enable.sh,nvidia-disable.sh,xsetup-hybrid.sh,xsetup-integrated.sh,,xsetup-nvidia.sh}

	# login managers
	insinto /etc/sddm.conf.d
	doins login_managers/sddm/20-${PN}.conf
	insinto /etc/lightdm/lightdm.conf.d
	doins login_managers/lightdm/20-${PN}.conf

	# misc
	insinto /usr/share
	doins ${PN}.conf

	distutils-r1_src_install
}

pkg_postinst() {
	elog "optimus-manager : enabling optimus-manager.service"
	mkdir -p /etc/systemd/system/graphical.target.wants/
	ln -s /usr/lib/systemd/system/optimus-manager.service /etc/systemd/system/graphical.target.wants/optimus-manager.service
	elog "Please reboot your computer before using optimus-manager"

	echo
	elog "Default configuration can be found and /usr/share/${PN}.conf. Please do not edit it."
	elog "Use /etc/${PN}/${PN}.conf instead (if doesn't exist, create it)."
	elog
	elog "Also you can add options in /etc/${PN}/xorg-intel.conf and /etc/${PN}/xorg-nvidia.conf"
	elog "If you're using KDE Plasma or LXQt, you may require the optimus-manager-qt package."
	elog "If you're using Gnome, you can install the optimus-manager-argos Gnome Shell extension."
	ewarn "Only works with Xorg. Wayland is not supported yet."
	echo
	elog "If you are not using SDDM or LightDM, you need set it manually."
	elog "More info can be found at:"
	elog "https://github.com/Askannz/optimus-manager/wiki/FAQ,-common-issues,-troubleshooting#my-display-manager-is-not-sddm-lightdm-nor-sddm"
	echo
	ewarn "If you have installed bumblebee package, you need to disable the bumblebee daemon since both packages are trying to"
	ewarn "control the GPU power switching."
	echo
}

pkg_postrm() {
	elog "optimus-manager : cleaning up auto-generated Xorg conf"
	xorg_conf=/etc/X11/xorg.conf.d/10-optimus-manager.conf
	if [ -f "$xorg_conf" ]; then
	    rm $xorg_conf
	fi

	elog "optimus-manager : disabling optimus-manager.service"
	service_file_link=/etc/systemd/system/graphical.target.wants/optimus-manager.service
	if [ -L "$service_file_link" ]; then
	    rm $service_file_link
	fi
}
