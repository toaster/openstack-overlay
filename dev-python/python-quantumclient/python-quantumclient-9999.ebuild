# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"

inherit git-2 distutils

DESCRIPTION="This is the client API library for Quantum."
HOMEPAGE="http://wiki.openstack.org/Quantum"
EGIT_REPO_URI="https://github.com/openstack/python-quantumclient.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
		dev-python/pep8 
		dev-python/nosexcover 
		dev-python/nose
		dev-python/coverage
		dev-python/paste 
		dev-python/pastedeploy 
		dev-python/python-gflags 
		dev-python/webob 
		net-misc/quantum"
RDEPEND="${DEPEND}"
