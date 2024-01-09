################################################################################
#
# lmdbxx
#
################################################################################

LMDBXX_VERSION = af649014456719b16100c7da31d46378c91b0e7b
LMDBXX_SITE = https://github.com/hoytech/lmdbxx.git
LMDBXX_SITE_METHOD = git
LMDBXX_LICENSE = Unlicense
LMDBXX_LICENSE_FILES = UNLICENSE
LMDBXX_INSTALL_STAGING = YES
LMDBXX_DEPENDENCIES = host-pkgconf lmdb

LMDBXX_CONF_OPTS = \
	-Dexamples=false \
	-Dtests=false

$(eval $(meson-package))
