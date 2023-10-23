# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm xdg-utils

DESCRIPTION="The world's most-loved password manager"
HOMEPAGE="https://1password.com"
SRC_URI="amd64? ( https://downloads.1password.com/linux/rpm/stable/x86_64/${P}.x86_64.rpm -> ${P}.x86_64.rpm )"

LICENSE="nofree"
SLOT="0"
KEYWORDS="amd64"

RESTRICT="mirror strip test bindist"

IUSE="policykit cli"

DEPEND="
x11-misc/xdg-utils
acct-group/onepassword
policykit? ( sys-auth/polkit )
cli? ( app-misc/1password-cli )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_prepare() {
	default
	xdg_environment_reset
}

src_unpack() {
	rpm_unpack ${P}.x86_64.rpm
}

src_install() {
	cp -ar "${S}/opt"  "${D}" || die "Install failed!"
	cp -ar "${S}/usr"  "${D}" || die "Install failed!"

	chgrp onepassword ${D}/opt/1Password/1Password-KeyringHelper
	chgrp onepassword ${D}/opt/1Password/1Password-BrowserSupport

	dosym /opt/1Password/1password /usr/bin/1password
}

pkg_postinst() {
	chmod 4755 /opt/1Password/chrome-sandbox
	chmod u+s /opt/1Password/1Password-KeyringHelper
	chmod g+s /opt/1Password/1Password-KeyringHelper
	chmod g+s /opt/1Password/1Password-BrowserSupport

	export POLICY_OWNERS
	POLICY_OWNERS="$(cut -d: -f1,3 /etc/passwd | grep -E ':[0-9]{4}$' | cut -d: -f1 | head -n 10 | sed 's/^/unix-user:/' | tr '\n' ' ')"
	eval "cat <<EOF
$(cat /opt/1Password/com.1password.1Password.policy.tpl)
EOF" > /usr/share/polkit-1/actions/com.1password.1Password.policy

	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
