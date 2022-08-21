# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit stardict

FROM_LANG="English"
TO_LANG="Simplified Chinese (GB)"

DICT_PV=${PV##*.}
DICT_P=stardict-ecdict-${PV}

DESCRIPTION="Free English to Chinese Dictionary Database"

HOMEPAGE="https://github.com/skywind3000/ECDICT"
SRC_URI="https://github.com/skywind3000/ECDICT/releases/download/${PV}/ecdict-stardict-${DICT_PV}.zip -> ${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

MY_PN=${PN%-*}
S=${WORKDIR}/${MY_PN%-*}-2.4.2

IUSE="+gzip"

REQUIRED_USE="gzip"
