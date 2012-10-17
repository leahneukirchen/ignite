# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=ignite
pkgver=0.9.0
pkgrel=3
pkgdesc="A replacement for sysvinit based upon runit"
url="https://github.com/chneukirchen/ignite"
license=('custom')
arch=('i686' 'x86_64' 'arm')
depends=('bash' 'util-linux' 'procps-ng' 'runit-musl' 'sysvinit-tools')
makedepends=('gcc' 'make' 'coreutils' 'sed' 'musl')
conflicts=('ignite-git')
install=ignite.install
source=(http://chneukirchen.org/releases/$pkgname-$pkgver.tar.gz)
sha256sums=('f6757e125936f10fcc8c689abc15842cac5b3bd3bc36c93a4232fc0b07a9d365')

# /etc/sv gets added below to this!
backup=('etc/runit/1'
	'etc/runit/2'
	'etc/runit/3'
        'etc/runit/ctrlaltdel')

build() {
  cd "$srcdir/$pkgname-$pkgver/util"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  backup+=(etc/sv/*/run)
  backup+=(etc/sv/*/finish)

  cp -r etc $pkgdir/
  chmod -R u=rwX,g=rX,o=rX $pkgdir/etc

  install -D -m0755 util/pause $pkgdir/usr/bin/pause
  install -D -m0644 util/pause.1 $pkgdir/usr/share/man/man1/pause.1
  
  install -D -m0755 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
