# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Command line aggregation translation tool, support Google, Bing, Youdao, etc"
HOMEPAGE="https://github.com/skywind3000/translator"

EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="socks5"

DEPEND="dev-python/requests[socks5=]"
RDEPEND="${DEPEND}"

src_compile() {
	:;
}

src_install() {
	insinto /usr/share/${PN}/
	doins translator.py
	dobin "${FILESDIR}"/translator
	default
}
