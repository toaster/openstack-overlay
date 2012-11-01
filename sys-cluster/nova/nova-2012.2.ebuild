# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils eutils

DESCRIPTION="Nova is a cloud computing fabric controller (the main part of an
IaaS system). It is written in Python."
HOMEPAGE="https://launchpad.net/nova"
SRC_URI="http://launchpad.net/${PN}/folsom/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="controller"

DEPEND="dev-python/setuptools
        dev-python/lockfile
        dev-python/netaddr
        dev-python/eventlet
        dev-python/python-gflags
        dev-python/nosexcover
        dev-python/sqlalchemy-migrate
        dev-python/pylint
        dev-python/mox
        dev-python/pep8
        dev-python/cheetah
        dev-python/carrot
        dev-python/lxml
        dev-python/python-daemon
        dev-python/wsgiref
        dev-python/sphinx
        dev-python/suds
        dev-python/paramiko
        dev-python/feedparser"
RDEPEND="${DEPEND}
         app-emulation/libvirt[python,qemu,virt-network]
         dev-python/m2crypto
         dev-python/python-glanceclient
         dev-python/python-novaclient
         dev-python/nova-adminclient
         dev-python/boto
         dev-python/prettytable
         dev-python/mysql-python
         dev-python/iso8601
         controller? ( net-misc/rabbitmq-server )"

src_prepare() {
    epatch "${FILESDIR}/${P}-workaround-993663.patch"
}

src_install() {
    distutils_src_install
    newconfd "${FILESDIR}/${P}.confd" nova
    newinitd "${FILESDIR}/${P}.initd" nova

    for function in api cert compute consoleauth network objectstore scheduler volume xvpvncproxy; do
        dosym /etc/init.d/nova /etc/init.d/nova-${function}
    done

    diropts -m 0750
    dodir /var/run/nova /var/log/openstack /var/lock/nova /var/lib/nova/tmp /var/lib/nova/instances
    keepdir /var/run/nova
}
