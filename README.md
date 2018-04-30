**Copy from :**

* eroen
* gentoo-zh
* 4nykey

**How to use :**

```
emerge --sync && emerge -av layman
vim /etc/portage/repos.conf/layman.conf
```

Add :
```
[gig]
priority = 50
location = /var/lib/layman/gig
layman-type = git
sync-type = laymansync
sync-uri = https://github.com/Gig-OS/gig.git
auto-sync = Yes
```
