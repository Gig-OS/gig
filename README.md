### How to use

```
emerge --sync
emerge -av app-eselect/eselect-repository
eselect repository enable gig
```

OR

```
emerge -av layman
layman -S
layman -a gig
```

### Packages

```
 Package name                      | Version     | Role   | Homepage                                                | Description
===================================|=============|========|=========================================================|====================
 acct-group/libvirtdbus            | 0           |        |                                                         |
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 app-admin/cockpit-benchmark       | 0.2.1       |        | https://github.com/45Drives/cockpit-benchmark           | A Storage Benchmark Utility for Cockpit.
                                   | 9999        |        |                                                         |
   app-admin/cockpit               | 255.1       | RD     | http://cockpit-project.org/                             | Server Administration Web Interface
                                   | 9999        |        |                                                         |
     acct-group/cockpit-ws         | 0           | RD     |                                                         | Server Administration Web Interface
     acct-group/cockpit-wsinstance | 0           | RD     |                                                         | Server Administration Web Interface
     acct-user/cockpit-ws          | 0           | RD     |                                                         | Server Administration Web Interface
     acct-user/cockpit-wsinstance  | 0           | RD     |                                                         | Server Administration Web Interface
     app-metrics/pcp               | 5.3.4       |  D, RD | http://pcp.io                                           | Performance Co-Pilot, system performance and analysis framework
                                   | 9999        |        |                                                         |
       acct-group/pcp              | 0           | RD     |                                                         | Performance Co-Pilot, system performance and analysis framework
       acct-user/pcp               | 0           | RD     |                                                         | Performance Co-Pilot
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 app-admin/cockpit-file-sharing    | 2.4.1       |        | https://github.com/45Drives/cockpit-file-sharing        | A Cockpit plugin to easily manage samba and NFS file sharing.
                                   | 9999        |        |                                                         |
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 app-admin/cockpit-machines        | 254         |        | http://cockpit-project.org/                             | This is the Cockpit user interface for virtual machines
   app-emulation/libvirt-dbus      | 1.4.0       | RD     | http://libvirt.org                                      | DBus protocol binding for libvirt native C API
     acct-user/libvirtdbus         | 0           | RD     |                                                         | Libvirt D-Bus bridge
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 app-admin/cockpit-navigator       | 0.5.5       |        | https://github.com/45Drives/cockpit-navigator           | A Featureful File Browser for Cockpit.
                                   | 9999        |        |                                                         |
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 app-admin/cockpit-zfs-manager     | 0.3.4.514   |        | https://github.com/optimans/cockpit-zfs-manager         | Cockpit ZFS Manager is an interactive ZFS on Linux admin package for Cockpit.
                                   | 9999        |        |                                                         |
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 app-dicts/stardict-ecdict-en-zh   | 1.0.28      |        | https://github.com/skywind3000/ECDICT                   | Free English to Chinese Dictionary Database
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 app-dicts/translator              | 9999        |        | https://github.com/skywind3000/translator               | Command line aggregation translation tool, support Google, Bing, Youdao, etc
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 app-emulation/looking-glass       | 0_beta4     |        | https://looking-glass.hostfission.com                   | A low latency KVM FrameRelay implementation for guests with VGA PCI Passthrough
                                   | 0_beta4_rc3 |        |                                                         |
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 app-misc/notion-app-enhanced      | 2.0.16.5    |        | https://github.com/notion-enhancer/notion-repackaged    | Notion Desktop builds with Notion Enhancer for Windows, MacOS and Linux
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 app-misc/tusk                     | 0.23.0      |        | https://klauscfhq.github.io/tusk                        | Refined Evernote desktop app
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 app-misc/urlview                  | 0.9_p21     |        | https://packages.qa.debian.org/u/urlview.html           | A curses URL parser for text files
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 dev-python/docker-pycreds         | 0.3.0       |        | https://github.com/shin-/dockerpy-creds/                | Python bindings for the docker credentials store API
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 dev-python/python-potr            | 1.0.2       |        | https://pypi.org/project/python-potr/                   | pure Python Off-The-Record encryption
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 dev-util/StarUML                  | 3.2.2       |        | http://staruml.io/                                      | A sophisticated software modeler for agile and concise modeling
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 games-board/majsoul-plus          | 2.0.0       |        | https://github.com/MajsoulPlus/majsoul-plus             | A dedicated browser for Mahjong Majsoul, provides some proprietary features
                                   | 2.0.1       |        |                                                         |
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 games-strategy/0ad-balanced-maps  | 2           |        |                                                         | 0ad balanced maps mod
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 games-strategy/0ad-delenda-est    | 02          |        |                                                         | 0ad delenda est mod
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 games-strategy/0ad-zh-lang        | 0.0.23b     |        |                                                         | chinese support for 0ad
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 media-gfx/colorpicker             | 1.0.5       |        | https://github.com/RonnyDo/ColorPicker                  | A color picker for elementaryOS.
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 media-sound/scdl                  | 1.3.3_beta1 |        | https://github.com/flyingrub/scdl                       | Soundcloud Music Downloader
                                   | 9999        |        |                                                         |
   dev-python/soundcloud-python    | 0.5.0       | RD     | https://github.com/soundcloud/soundcloud-python         | A friendly wrapper around the Soundcloud API
   dev-python/wget                 | 3.2         | RD     | https://pypi.python.org/pypi/wget                       | pure python download utility
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 net-proxy/frp-bin                 | 0.32.0      |        | https://github.com/fatedier/frp                         | A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet.
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 net-proxy/simple-obfs             | 0.0.5       |        | https://github.com/shadowsocks/simple-obfs              | A simple obfuscating tool
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 net-proxy/v2rayxplus              | 1.0.0       |        | https://gitlab.com/xiayesuifeng/v2rayxplus              | A v2ray GUI client written in GO
   net-proxy/v2ray                 | 4.22.1      | RD     | https://www.v2ray.com/                                  | A platform for building proxies to bypass network restrictions.
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 sys-devel/arch-install-scripts    | 23          |        | https://projects.archlinux.org/arch-install-scripts.git | Scripts to aid in installing Arch Linux
   sys-apps/pacman                 | 5.2.2       |  D, RD | https://archlinux.org/pacman                            | Archlinux's binary package manager
     app-crypt/archlinux-keyring   | 20200622    |  D, RD | https://git.archlinux.org/archlinux-keyring.git         | GnuPG keyring of Archlinux developer keys
     sys-apps/pacman-mirrorlist    | 20200801    | RD     | https://www.archlinux.org/mirrorlist/                   | Repository list for Archlinux's binary package manager
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 sys-kernel/zenpower               | 0.1.12      |        | https://github.com/ocerman/zenpower                     | Linux kernel driver for reading sensors of AMD Zen family CPUs
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 x11-misc/hardcode-tray            | 4.3         |        | https://github.com/bilelmoussaoui/Hardcode-Tray         | Fixes Hardcoded tray icons in Linux
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 x11-misc/optimus-manager-qt       | 1.6.4       |        | https://github.com/Shatur95/optimus-manager-qt          | Qt-based interface for Optimus Manager
   x11-misc/optimus-manager        | 1.4         | RD     | https://github.com/Askannz/optimus-manager              | Management utility to handle GPU switching for Optimus laptops
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 x11-misc/polybar                  | 3.1.0       |        | https://github.com/jaagr/polybar                        | A fast and easy-to-use status bar
-----------------------------------|-------------|--------|---------------------------------------------------------|--------------------
 x11-terms/termite                 | 13          |        | https://github.com/thestinger/termite                   | A keyboard-centric VTE-based terminal
                                   | 9999        |        |                                                         |
   x11-libs/vte                    | 0.48.4      |  D, RD | https://wiki.gnome.org/action/show/Apps/Terminal/VTE    | Library providing a virtual terminal emulator widget
===================================|=============|========|=========================================================|====================
```
+ ` D` means the classic dependencies (e.g.: libraries and headers)
+ `BD` means the build dependencies (e.g.: virtual/pkgconfig)
+ `RD` means runtime dependencies

_(All these dependencies are parsed literally.)_
