################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="chrome"
PKG_VERSION="1.0"
PKG_REV="100"
PKG_ARCH="x86_64"
PKG_LICENSE="Custom"
PKG_SITE="http://www.google.com/chrome"
PKG_DEPENDS_TARGET="toolchain at-spi2-atk atk cairo chrome-libXcomposite \
                    chrome-libXdamage chrome-libXfixes chrome-libXi chrome-libXrender \
                    chrome-libXtst chrome-libxcb cups gdk-pixbuf gtk3 harfbuzz \
                    libXcursor libxss nss pango scrnsaverproto unclutter"
PKG_SECTION="browser"
PKG_SHORTDESC="Google Chrome Browser"
PKG_LONGDESC="Google Chrome Browser"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Chrome"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_ADDON_PROVIDES="executable"

make_target() {
  :
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin \
           $ADDON_BUILD/$PKG_ADDON_ID/config \
           $ADDON_BUILD/$PKG_ADDON_ID/gdk-pixbuf-modules \
           $ADDON_BUILD/$PKG_ADDON_ID/lib

  # config
  cp -P $PKG_DIR/config/* $ADDON_BUILD/$PKG_ADDON_ID/config

  # atk
  cp -PL $(get_build_dir atk)/.install_pkg/usr/lib/libatk-1.0.so.0 $ADDON_BUILD/$PKG_ADDON_ID/lib

  # cairo
  cp -PL $(get_build_dir cairo)/.install_pkg/usr/lib/libcairo-gobject.so.2 $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PL $(get_build_dir cairo)/.install_pkg/usr/lib/libcairo.so.2 $ADDON_BUILD/$PKG_ADDON_ID/lib

  # gdk-pixbuf
  cp -PL $(get_build_dir gdk-pixbuf)/.install_pkg/usr/lib/libgdk_pixbuf-2.0.so.0 $ADDON_BUILD/$PKG_ADDON_ID/lib

  # gdk-pixbuf modules
  cp -PL $(get_build_dir gdk-pixbuf)/.install_pkg/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/* $ADDON_BUILD/$PKG_ADDON_ID/gdk-pixbuf-modules

  # gtk3 gdk3
  cp -PL $(get_build_dir gtk3)/.install_pkg/usr/lib/libgtk-3.so.0 $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PL $(get_build_dir gtk3)/.install_pkg/usr/lib/libgdk-3.so.0 $ADDON_BUILD/$PKG_ADDON_ID/lib

  # harfbuzz
  cp -PL $(get_build_dir harfbuzz)/.install_pkg/usr/lib/libharfbuzz.so.0 $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PL $(get_build_dir harfbuzz)/.install_pkg/usr/lib/libharfbuzz-icu.so* $ADDON_BUILD/$PKG_ADDON_ID/lib

  # libatk-bridge
  cp -PL $(get_build_dir at-spi2-atk)/.install_pkg/usr/lib/libatk-bridge-2.0.so.0 $ADDON_BUILD/$PKG_ADDON_ID/lib 

  # libatspi
  cp -PL $(get_build_dir at-spi2-core)/.install_pkg/usr/lib/libatspi.so.0 $ADDON_BUILD/$PKG_ADDON_ID/lib 

  # libcups
  cp -PL $(get_build_dir cups)/cups/libcups.so.2 $ADDON_BUILD/$PKG_ADDON_ID/lib

  # libxcb
  cp -PL $(get_build_dir chrome-libxcb)/.install_pkg/usr/lib/libxcb.so.1 $ADDON_BUILD/$PKG_ADDON_ID/lib  

  # libXcomposite
  cp -PL $(get_build_dir chrome-libXcomposite)/.install_pkg/usr/lib/libXcomposite.so.1 $ADDON_BUILD/$PKG_ADDON_ID/lib 

  # libXcursor
  cp -PL $(get_build_dir libXcursor)/.install_pkg/usr/lib/libXcursor.so.1 $ADDON_BUILD/$PKG_ADDON_ID/lib 

  # libXdamage
  cp -PL $(get_build_dir chrome-libXdamage)/.install_pkg/usr/lib/libXdamage.so.1 $ADDON_BUILD/$PKG_ADDON_ID/lib 

  # libXfixes
  cp -PL $(get_build_dir chrome-libXfixes)/.install_pkg/usr/lib/libXfixes.so.3 $ADDON_BUILD/$PKG_ADDON_ID/lib

  # libXi  
  cp -PL $(get_build_dir chrome-libXi)/.install_pkg/usr/lib/libXi.so.6 $ADDON_BUILD/$PKG_ADDON_ID/lib

  # libXrender
  cp -PL $(get_build_dir chrome-libXrender)/.install_pkg/usr/lib/libXrender.so.1 $ADDON_BUILD/$PKG_ADDON_ID/lib

  # libxss
  cp -PL $(get_build_dir libxss)/.install_pkg/usr/lib/libXss.so.1 $ADDON_BUILD/$PKG_ADDON_ID/lib 

  # libXtst
  cp -PL $(get_build_dir chrome-libXtst)/.install_pkg/usr/lib/libXtst.so.6 $ADDON_BUILD/$PKG_ADDON_ID/lib

  # pango
  cp -PL $(get_build_dir pango)/.install_pkg/usr/lib/libpangocairo-1.0.so.0 $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PL $(get_build_dir pango)/.install_pkg/usr/lib/libpango-1.0.so.0 $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -PL $(get_build_dir pango)/.install_pkg/usr/lib/libpangoft2-1.0.so.0 $ADDON_BUILD/$PKG_ADDON_ID/lib

  # unclutter
  cp -P $(get_build_dir unclutter)/.install_pkg/usr/bin/unclutter $ADDON_BUILD/$PKG_ADDON_ID/bin

}
