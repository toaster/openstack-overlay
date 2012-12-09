# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils eutils

DESCRIPTION="Cinder is the block storage component of OpenStack."
HOMEPAGE="https://launchpad.net/cinder"
SRC_URI="http://launchpad.net/${PN}/folsom/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
          dev-python/amqplib
          dev-python/anyjson
          dev-python/eventlet
          dev-python/greenlet
          dev-python/iso8601
          dev-python/kombu
          dev-python/lockfile
          =dev-python/lxml-2.3*
          dev-python/paramiko
          dev-python/paste
          dev-python/pastedeploy
          dev-python/python-daemon
          dev-python/python-glanceclient
          dev-python/routes
          dev-python/sqlalchemy
          dev-python/sqlalchemy-migrate
          dev-python/suds
          dev-python/webob
          dev-python/wsgiref
          "

src_install() {
    distutils_src_install
    newconfd "${FILESDIR}/${P}.confd" ${PN}
    newinitd "${FILESDIR}/${P}.initd" ${PN}

    for function in api scheduler volume; do
        dosym /etc/init.d/${PN} /etc/init.d/${PN} ${function}
    done

    diropts -m 0750
    dodir /var/log/openstack /var/lock/${PN}
}
