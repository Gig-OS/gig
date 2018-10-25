# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# curl -s https://raw.githubusercontent.com/dbrgn/tealdeer/v1.1.0/Cargo.lock | sed 's/^"checksum \([[:graph:]]\+\) \([[:graph:]]\+\) (.*$/\1-\2/'
CRATES="
adler32-1.0.3
aho-corasick-0.6.8
ansi_term-0.10.2
assert_cli-0.5.4
atty-0.2.11
backtrace-0.3.9
backtrace-sys-0.1.24
bitflags-0.9.1
bitflags-1.0.4
build_const-0.2.1
bytecount-0.3.2
cargo_metadata-0.2.3
cargo_metadata-0.5.8
cc-1.0.25
cfg-if-0.1.6
clippy-0.0.174
clippy_lints-0.0.174
colored-1.6.1
crc-1.8.1
curl-0.4.18
curl-sys-0.4.13
difference-1.0.0
docopt-0.8.3
either-1.5.0
env_logger-0.5.13
environment-0.1.1
error-chain-0.11.0
filetime-0.2.1
flate2-1.0.4
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
getopts-0.2.18
glob-0.2.11
humantime-1.1.1
idna-0.1.5
if_chain-0.1.3
itertools-0.6.5
itoa-0.4.3
kernel32-sys-0.2.2
lazy_static-0.2.11
lazy_static-1.1.0
libc-0.2.43
libz-sys-1.0.24
log-0.4.5
matches-0.1.8
memchr-2.1.0
miniz-sys-0.1.11
miniz_oxide-0.2.0
miniz_oxide_c_api-0.2.0
openssl-probe-0.1.2
openssl-sys-0.9.39
percent-encoding-1.0.1
pkg-config-0.3.14
proc-macro2-0.4.20
pulldown-cmark-0.0.15
pulldown-cmark-0.1.2
quick-error-1.2.2
quine-mc_cluskey-0.2.4
quote-0.6.8
rand-0.4.3
redox_syscall-0.1.40
redox_termios-0.1.1
regex-0.2.11
regex-1.0.5
regex-syntax-0.4.2
regex-syntax-0.5.6
regex-syntax-0.6.2
remove_dir_all-0.5.1
rustc-demangle-0.1.9
ryu-0.2.6
same-file-1.0.3
schannel-0.1.14
semver-0.6.0
semver-0.9.0
semver-parser-0.7.0
serde-1.0.80
serde_derive-1.0.80
serde_json-1.0.32
skeptic-0.13.3
socket2-0.3.8
strsim-0.6.0
syn-0.15.13
tar-0.4.17
tempdir-0.3.7
termcolor-1.0.4
termion-1.5.1
thread_local-0.3.6
time-0.1.40
toml-0.4.8
ucd-util-0.1.1
unicode-bidi-0.3.4
unicode-normalization-0.1.7
unicode-width-0.1.5
unicode-xid-0.1.0
url-1.7.1
utf8-ranges-1.0.1
utime-0.2.1
vcpkg-0.2.6
version_check-0.1.5
walkdir-2.2.5
winapi-0.2.8
winapi-0.3.6
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.1
winapi-x86_64-pc-windows-gnu-0.4.0
wincolor-1.0.1
xattr-0.2.2
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
