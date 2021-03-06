# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="Useful additions to futures, from the future"
HOMEPAGE="https://pypi.python.org/pypi/futurist http://docs.openstack.org/developer/futurist"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CDEPEND="
	>=dev-python/pbr-1.4[${PYTHON_USEDEP}]
	<dev-python/pbr-2.0[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools
	${CDEPEND}"
RDEPEND="
	${CDEPEND}
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/monotonic-0.3[${PYTHON_USEDEP}]
	>=dev-python/futures-3.0.0[$(python_gen_usedep 'python2_7')]
	>=dev-python/contextlib2-0.4.0[${PYTHON_USEDEP}]"
