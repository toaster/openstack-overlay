# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTIOn="Keystone is a cloud identity service written in Python, which
provides authentication, authorization, and an OpenStack service catalog. It
implements OpenStac's Identity API."
HOMEPAGE="https://launchpad.net/keystone"
SRC_URI="http://launchpad.net/${PN}/folsom/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mysql sqlite"

DEPEND="dev-python/setuptools
		dev-python/pep8
		dev-python/lxml
		dev-python/python-daemon
		"
RDEPEND="${DEPEND}
		 =dev-python/python-novaclient-2.6.10
		 dev-python/python-ldap
		 dev-python/passlib
		 mysql? ( dev-python/sqlalchemy[mysql] )
		 sqlite? ( dev-python/sqlalchemy[sqlite] )
		 dev-python/sqlalchemy-migrate
		 dev-python/eventlet
		 dev-python/greenlet
		 dev-python/iso8601
		 dev-python/routes
		 "

src_install() {
	distutils_src_install
	newconfd "${FILESDIR}/keystone.confd" keystone
	newinitd "${FILESDIR}/keystone.initd" keystone

	diropts -m 0750
	dodir /var/run/keystone /var/log/keystone
}
