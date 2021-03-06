# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1

MY_PV="${PV/_beta/b}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Simple scripting language for web browsing with Python API"
HOMEPAGE="http://twill.idyll.org/"
SRC_URI="http://darcs.idyll.org/~t/projects/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ppc ~ppc64 x86"
IUSE="doc examples"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? (
		$(python_gen_cond_dep 'dev-python/epydoc[${PYTHON_USEDEP}]' python2_7)
		|| (
			dev-python/dnspython:0[${PYTHON_USEDEP}]
			virtual/dnspython:0[${PYTHON_USEDEP}]
		)
	)"

S="${WORKDIR}/${MY_P}"

python_compile_all() {
	if use doc; then
		pushd doc > /dev/null || die
		chmod +x make-epydoc.sh || die
		./make-epydoc.sh || die
		popd> /dev/null || die
	fi
}

python_install_all() {
	use doc && HTML_DOCS=( doc/epydoc-html/. )
	use examples && local EXAMPLES=( examples/. )
	distutils-r1_python_install_all
}
