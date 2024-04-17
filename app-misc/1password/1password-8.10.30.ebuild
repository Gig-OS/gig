# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg-utils

DESCRIPTION="The world's most-loved password manager"
HOMEPAGE="https://1password.com"
SRC_URI="
	amd64? ( https://downloads.1password.com/linux/tar/stable/x86_64/"${PN}"-"${PV}".x64.tar.gz -> "${P}"-amd64.tar.gz )
	arm64? ( https://downloads.1password.com/linux/tar/stable/aarch64/"${PN}"-"${PV}".arm64.tar.gz -> "${P}"-arm64.tar.gz )
"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE="policykit cli"

RESTRICT="mirror strip test bindist"

DEPEND="
x11-misc/xdg-utils
acct-group/onepassword
policykit? ( sys-auth/polkit )
cli? ( app-misc/1password-cli )
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	xdg_environment_reset
}

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
	mv * "${P}" || die "Unpack failed!"
}

src_install() {
	mkdir -p "${D}"/opt/1Password
	cp -ar "${S}"/*  "${D}/opt/1Password/" || die "Install failed!"

	mkdir -p "${D}"/usr/share/polkit-1/actions/
	export POLICY_OWNERS
	POLICY_OWNERS="$(cut -d: -f1,3 /etc/passwd | grep -E ':[0-9]{4}$' | cut -d: -f1 | head -n 10 | sed 's/^/unix-user:/' | tr '\n' ' ')"
	eval "cat <<EOF
$(cat "${D}"/opt/1Password/com.1password.1Password.policy.tpl)
EOF" > "${D}"/usr/share/polkit-1/actions/com.1password.1Password.policy

	dosym /opt/1Password/1password /usr/bin/1password
	dosym /opt/1Password/op-ssh-sign /usr/bin/op-ssh-sign

	mkdir -p "${D}"/usr/share
	mv "${D}"/opt/1Password/resources/icons/ "${D}"/usr/share/
	domenu "${S}"/resources/1password.desktop

	mkdir -p "${D}"/etc/1password
	mv "${D}"/opt/1Password/resources/custom_allowed_browsers "${D}"/etc/1password/
}

pkg_postinst() {
	chmod 4755 /opt/1Password/chrome-sandbox
	chgrp onepassword /opt/1Password/1Password-BrowserSupport
	chmod g+s /opt/1Password/1Password-BrowserSupport

	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
