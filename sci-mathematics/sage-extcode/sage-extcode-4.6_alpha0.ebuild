# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

#MY_P="extcode-${PV}"
MY_P="extcode-4.6.alpha0"

DESCRIPTION="Extcode for Sage"
HOMEPAGE="http://www.sagemath.org"
#SRC_URI="mirror://sage/spkg/standard/${MY_P}.spkg -> ${P}.tar.bz2"
SRC_URI="http://sage.math.washington.edu/home/release/sage-4.6.alpha0/sage-4.6.alpha0/spkg/standard/${MY_P}.spkg -> ${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	find . -name "*pyc" -type f -delete \
		|| die "failed to remove precompiled files"
}

src_install() {
	# remove stuff not needed
	rm -rf .hg .hgignore .hgtags mirror sage-push spkg-debian spkg-dist \
		spkg-install dist || die "failed to remove useless files"

	insinto /usr/share/sage/data/extcode
	doins -r * || die
}