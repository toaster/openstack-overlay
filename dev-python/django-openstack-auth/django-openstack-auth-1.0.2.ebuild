# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="A Django authentication backend for use with the OpenStack Keystone
		Identity backend."
HOMEPAGE="https://github.com/gabrielhurley/django_openstack_auth"
SRC_URI="https://github.com/gabrielhurley/django_openstack_auth/tarball/${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools" #dev-python/pip"
RDEPEND="${DEPEND}
		>=dev-python/django-1.4
		dev-python/python-keystoneclient"

src_unpack() {
	mv ${DISTDIR}/${A} ${DISTDIR}/${A}.tgz
	unpack ${A}.tgz
	mv gabrielhurley-django_openstack_auth-* ${P}
}
