# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_P="${PN}_${PV}.orig"
S="${WORKDIR}/oslo.config-${PV}"

PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="The Oslo project produces a set of python libraries containing
infrastructure code shared by OpenStack projects. The APIs provided by these
libraries should be high quality, stable, consistent and generally useful."
HOMEPAGE="https://wiki.openstack.org/wiki/Oslo"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+files/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

