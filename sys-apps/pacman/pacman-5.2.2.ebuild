# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools

DESCRIPTION="Archlinux's binary package manager"
HOMEPAGE="https://archlinux.org/pacman https://wiki.archlinux.org/index.php/Pacman"

if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.archlinux.org/pacman.git"
else
	SRC_URI="https://sources.archlinux.org/other/pacman/${P}.tar.gz"
	# Do *not* re-add ~x86!
	# https://www.archlinux.org/news/phasing-out-i686-support/
	KEYWORDS="-* ~amd64"
fi

LICENSE="GPL-2"
SLOT="0/10"

IUSE="curl debug doc +gpg libressl test"
DEPEND="
	app-crypt/archlinux-keyring
	app-arch/libarchive:=[lzma]
	gpg? ( >=app-crypt/gpgme-1.13.0:= )
	curl? ( net-misc/curl )
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )
	virtual/libiconv
	virtual/libintl
	test? (
		sys-apps/fakeroot
		sys-apps/fakechroot
	)
"
RDEPEND="
	${DEPEND}
	sys-apps/pacman-mirrorlist
"
BDEPEND="
	app-text/asciidoc
	doc? ( app-doc/doxygen )
"

# Plenty tests fail because we're actually not on a archlinux system.
RESTRICT="test"

src_prepare() {
	# Remove a line that adds "-Werror" in ./configure when
	# "--enable-debug" is passed:
	sed -i -e '/-Werror/d' configure.ac || die

	default
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		--disable-static
		--localstatedir=/var
		--disable-git-version
		# Help protect users from shooting their
		# Gentoo installation in its foot.
		--with-root-dir="${EPREFIX}/var/chroot/archlinux"
		$(use_enable debug)
		# full doc with doxygen
		$(use_enable doc doxygen)
		$(use_with curl libcurl)
		$(use_with gpg gpgme)
	)
	econf "${myeconfargs[@]}"
}

src_install() {
	dodir /etc/pacman.d/

	# see bug #631754
	dodir /var/chroot/archlinux
	keepdir /var/chroot/archlinux /var/lib/pacman

	default
	find "${D}" -name '*.la' -delete || die "Couldn't remove straying .la files"

	# Avoid creating stuff inside /var/cache/,
	# see bug #633742 for more information.
	rm -r "${D}/var/cache/pacman"
	rmdir "${D}/var/cache"
}

pkg_postinst() {

	/usr/bin/pacman-key --init || die
	/usr/bin/pacman-key --populate archlinux || die

	einfo
	einfo "The default root dir was set to ${EPREFIX}/var/chroot/archlinux"
	einfo "to avoid breaking Gentoo systems due to oscitancy."
	einfo "If you prefer another directory, take a look at"
	einfo "pacman's parameter -r|--root."
	einfo
	einfo "You will need to setup at least one mirror in"
	einfo "   /etc/pacman.d/mirrorlist."
	einfo "This list is installed by sys-apps/pacman-mirrorlist but can be"
	einfo "updated manually by fetching from"
	einfo "https://wiki.archlinux.org/index.php/Mirror"
	einfo
	einfo "With pacman 5.1 contrib packages were moved into a seprate package."
	einfo
}
