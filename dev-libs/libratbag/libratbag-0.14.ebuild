# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_7 )
inherit meson python-single-r1 udev

DESCRIPTION="A DBus daemon to configure input devices, mainly high-end/gaming mice"
HOMEPAGE="https://github.com/libratbag/libratbag"
SRC_URI="https://github.com/libratbag/libratbag/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+systemd elogind doc test"
REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
	( ^^ ( elogind systemd ) )"
RESTRICT="!test? ( test )"

RDEPEND="
	${PYTHON_DEPS}
	elogind? ( >=sys-auth/elogind-227 )
	systemd? ( >=sys-apps/systemd-227 )
	dev-libs/glib:2
	dev-libs/json-glib
	dev-libs/libunistring
	dev-libs/libevdev
	$(python_gen_cond_dep '
		dev-python/python-evdev[${PYTHON_MULTI_USEDEP}]')
	virtual/libudev
"
DEPEND="
	${RDEPEND}
	dev-lang/swig
"
BDEPEND="
	virtual/pkgconfig
	$(python_gen_cond_dep '
		dev-python/pygobject:3[${PYTHON_MULTI_USEDEP}]
	')
	doc? ( app-doc/doxygen )
	test? (
		>=dev-libs/check-0.9.10
		$(python_gen_cond_dep '
		dev-python/lxml[${PYTHON_MULTI_USEDEP}]')
		dev-util/valgrind
	)
"

src_prepare() {
	default

	python_setup
	local pkgconfig_target="$(echo ${EPYTHON} | sed 's/python/python-/')"
	sed -i "s/dependency('python3')/dependency('${pkgconfig_target}')/" meson.build || die
}

src_configure() {
	local emesonargs=(
		-Ddocumentation=$(usex doc true false)
		-Dtests=$(usex test true false)
		-Dudev-dir="${EPREFIX}$(get_udevdir)"
		-Dlogind-provider=$(usex elogind elogind systemd)
		-Dsystemd=$(usex systemd true false)
	)
	meson_src_configure
}

src_install() {
	meson_src_install
	python_optimize
	python_fix_shebang "${ED}"/usr/bin/
}

pkg_postinst() {
	elog 'Running ratbagd as DBus-activated systemd service:'
	elog 'sudo systemctl daemon-reload'
	elog 'sudo systemctl reload dbus.service'
	elog 'sudo systemctl enable ratbagd.service'
	elog 'sudo systemctl start ratbagd.service'
}
