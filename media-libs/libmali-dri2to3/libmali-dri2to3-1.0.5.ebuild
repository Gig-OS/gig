# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

DESCRIPTION="This is a library implementing DRI2 on top of DRI3 for running Mali
blob X11 drivers under Xwayland"
HOMEPAGE="https://gitlab.com/panfork/dri2to3"
EGIT_REPO_URI="https://gitlab.com/panfork/dri2to3"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
