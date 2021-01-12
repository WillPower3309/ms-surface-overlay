# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
ETYPE="sources"

inherit kernel-2

K_NOSETEXTRAVERSION="don't_set_it"

DESCRIPTION="The Surface Kernel Sources v5.x"
HOMEPAGE="https://github.com/linux-surface/kernel"

SURFACE_VERSION="v5.10-surface"
SURFACE_FILE="${P}.tar.gz"
SURFACE_URI="https://github.com/linux-surface/kernel/archive/${SURFACE_VERSION}.tar.gz -> ${SURFACE_FILE}"
SRC_URI="${KERNEL_URI} ${SURFACE_URI}";

KEYWORDS="-* ~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

KV_FULL="${PVR/_p/-surface}"
S="${WORKDIR}"/linux-"${KV_FULL}"

K_EXTRAEINFO="For more info on ${P} and details on how to report problems, see: \
${HOMEPAGE}."

pkg_setup(){
	ewarn
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the Liquorix developers directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn
	kernel-2_pkg_setup
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
