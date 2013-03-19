# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_P="${PN}-2013.1.g3"
S="${WORKDIR}/${MY_P}dev"

PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="Heat is a service to orchestrate multiple composite cloud
applications using templates, through both an OpenStack-native ReST API and a
CloudFormation-compatible Query API."
HOMEPAGE="https://wiki.openstack.org/wiki/Heat"
SRC_URI="http://launchpad.net/${PN}/grizzly/grizzly-3/+download/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/setuptools"

RDEPEND="${DEPEND}
	>=dev-python/boto-2.4.0
	>=dev-python/eventlet-0.9.17
	>=dev-python/greenlet-0.3.1
	dev-python/httplib2
	>=dev-python/iso8601-0.1.4
	>=dev-python/kombu-1.0.4
	>=dev-python/lxml-2.3
	<=dev-python/lxml-2.3.5
	dev-python/oslo-config
	=dev-python/pastedeploy-1.5.0*
	dev-python/pycrypto
	dev-python/python-cinderclient
	dev-python/python-keystoneclient
	dev-python/python-memcached
	dev-python/python-novaclient
	dev-python/python-quantumclient
	dev-python/python-swiftclient
	>=dev-python/pyyaml-3.1.0
	=dev-python/routes-1.12.3*
	>=dev-python/sqlalchemy-0.7.8
	<=dev-python/sqlalchemy-0.7.9
	>=dev-python/sqlalchemy-migrate-0.7.2
	=dev-python/webob-1.2.3*
	"
