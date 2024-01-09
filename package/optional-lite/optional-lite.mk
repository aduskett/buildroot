################################################################################
#
# optional-lite
#
################################################################################

OPTIONAL_LITE_VERSION = 3.5.0
OPTIONAL_LITE_SITE = $(call github,martinmoene,optional-lite,v$(OPTIONAL_LITE_VERSION))
OPTIONAL_LITE_LICENSE = BSL-1.0
OPTIONAL_LITE_LICENSE_FILES = LICENSE.txt
# Header only library
OPTIONAL_LITE_INSTALL_TARGET = NO
OPTIONAL_LITE_INSTALL_STAGING = YES
OPTIONAL_LITE_CONF_OPTS = \
	-DOPTIONAL_LITE_OPT_BUILD_TESTS=OFF \
	-DOPTIONAL_LITE_OPT_BUILD_EXAMPLES=OFF \
	-DOPTIONAL_LITE_OPT_SELECT_STD=OFF \
	-DOPTIONAL_LITE_OPT_SELECT_NONSTD=OFF

$(eval $(cmake-package))
