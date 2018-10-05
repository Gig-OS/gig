# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
aho-corasick-0.6.4
ansi_term-0.10.2
assert_cli-0.5.4
atty-0.2.6
backtrace-0.3.5
backtrace-sys-0.1.16
bitflags-0.9.1
bitflags-1.0.1
bytecount-0.2.0
cargo_metadata-0.2.3
cargo_metadata-0.3.3
cc-1.0.4
cfg-if-0.1.2
chrono-0.4.0
clippy-0.0.174
clippy_lints-0.0.174
colored-1.6.0
curl-0.4.11
curl-sys-0.4.1
difference-1.0.0
docopt-0.8.3
dtoa-0.4.2
either-1.4.0
env_logger-0.5.3
environment-0.1.1
error-chain-0.11.0
filetime-0.1.15
flate2-1.0.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
getopts-0.2.17
glob-0.2.11
idna-0.1.4
if_chain-0.1.2
itertools-0.6.5
itoa-0.3.4
kernel32-sys-0.2.2
lazy_static-0.2.11
lazy_static-1.0.0
libc-0.2.36
libz-sys-1.0.18
log-0.4.1
matches-0.1.6
memchr-2.0.1
miniz-sys-0.1.10
num-0.1.42
num-integer-0.1.36
num-iter-0.1.35
num-traits-0.1.43
num-traits-0.2.0
openssl-probe-0.1.2
openssl-sys-0.9.24
percent-encoding-1.0.1
pkg-config-0.3.9
pulldown-cmark-0.0.15
pulldown-cmark-0.1.0
quine-mc_cluskey-0.2.4
quote-0.3.15
rand-0.4.2
redox_syscall-0.1.37
redox_termios-0.1.1
regex-0.2.6
regex-syntax-0.4.2
remove_dir_all-0.3.0
rustc-demangle-0.1.5
same-file-0.1.3
same-file-1.0.2
schannel-0.1.10
semver-0.6.0
semver-0.8.0
semver-parser-0.7.0
serde-1.0.27
serde_derive-1.0.27
serde_derive_internals-0.19.0
serde_json-1.0.9
skeptic-0.13.2
socket2-0.3.1
strsim-0.6.0
syn-0.11.11
synom-0.11.3
tar-0.4.14
tempdir-0.3.6
termcolor-0.3.3
termion-1.5.1
thread_local-0.3.5
time-0.1.39
toml-0.4.5
unicode-bidi-0.3.4
unicode-normalization-0.1.5
unicode-xid-0.0.4
unreachable-1.0.0
url-1.6.0
utf8-ranges-1.0.0
vcpkg-0.2.2
void-1.0.2
walkdir-1.0.7
walkdir-2.1.3
winapi-0.2.8
winapi-0.3.4
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
wincolor-0.1.5
xattr-0.1.11
xdg-2.1.0
"
inherit eutils cargo git-r3

DESCRIPTION="A very fast implementation of tldr in Rust."
HOMEPAGE="https://github.com/tldr-pages/tldr"
EGIT_REPO_URI="https://github.com/dbrgn/tealdeer"
SRC_URI="$(cargo_crate_uris ${CRATES})"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-apps/man-pages
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	cargo_src_install
	einstalldocs
}

pkg_postinst() {
	elog "Updating cache"
	tldr --update
}
