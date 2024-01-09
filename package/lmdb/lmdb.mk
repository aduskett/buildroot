################################################################################
#
# lmdb
#
################################################################################

LMDB_VERSION = 0.9.31
LMDB_SOURCE = LMDB_$(LMDB_VERSION).tar.gz
LMDB_SITE = https://github.com/LMDB/lmdb/archive/refs/tags
LMDB_LICENSE = OLDAP-2.8
LMDB_LICENSE_FILES = libraries/liblmdb/LICENSE
LMDB_INSTALL_STAGING = YES

define LMDB_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
		SOEXT=".so.$(LMDB_VERSION)" \
		-C $(@D)/libraries/liblmdb all
endef

define LMDB_INSTALL_STAGING_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		DESTDIR="$(STAGING_DIR)" \
		SOEXT=".so.$(LMDB_VERSION)" \
		-C $(@D)/libraries/liblmdb install

	$(INSTALL) -D -m 0644 $(LMDB_PKGDIR)/lmdb.pc.in \
		$(STAGING_DIR)/usr/lib/pkgconfig/lmdb.pc

	$(SED) 's/@VERSION@/$(LMDB_VERSION)/g;' \
		$(STAGING_DIR)/usr/lib/pkgconfig/lmdb.pc
endef

define LMDB_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		DESTDIR="$(TARGET_DIR)" \
		SOEXT=".so.$(LMDB_VERSION)" \
		-C $(@D)/libraries/liblmdb install
endef

$(eval $(generic-package))
