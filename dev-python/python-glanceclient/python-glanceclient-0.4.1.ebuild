# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND=2
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="This is a client library for Glance built on the OpenStack Images
API. It provides a Python API (the glanceclient module) and a command-line tool
(glance). This library fully supports the v1 Images API, while support for the
v2 API is in progress."
HOMEPAGE="https://launchpad.net/python-glanceclient"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
         =dev-python/prettytable-0.6*
         =dev-python/warlock-0.1.0
         =dev-python/python-keystoneclient-0.1*
         !<dev-python/python-keystoneclient-0.1.2"
