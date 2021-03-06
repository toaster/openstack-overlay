# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPENDS="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Provides services for discovering, registering, and retrieving
virtual machine images. Glance has a RESTful API that allows querying of VM
image metadata as well as retrieval of the actual image."
HOMEPAGE="https://launchpad.net/glance"
SRC_URI="http://launchpad.net/${PN}/folsom/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
		 dev-python/anyjson
		 dev-python/boto
		 >=dev-python/eventlet-0.9.12
		 >=dev-python/greenlet-0.3.1
		 dev-python/httplib2
		 dev-python/iso8601
		 dev-python/jsonschema
		 dev-python/kombu
		 dev-python/lxml
		 dev-python/passlib
		 dev-python/paste
		 dev-python/pastedeploy
		 dev-python/pycrypto
		 dev-python/routes
		 >=dev-python/sqlalchemy-0.7
		 >=dev-python/sqlalchemy-migrate-0.7
		 dev-python/webob
		 dev-python/wsgiref"

src_install() {
	distutils_src_install
	newconfd "${FILESDIR}/glance.confd" glance
	newinitd "${FILESDIR}/glance.initd" glance

	for function in api registry scrubber; do
		dosym /etc/init.d/glance /etc/init.d/glance-${function}
	done

	diropts -m 0750
	dodir /var/run/glance /var/log/openstack /var/lock/glance

	rm ${D}/usr/bin/glance
	rm ${D}/usr/bin/glance-2.7
}
