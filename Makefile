#
# Copyright (C) 2009-2012 Cyril Bouthors <cyril@bouthors.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

DESTDIR=/usr/local
VERSION=1.2
PKG=nagios-plugins-cyb

all:;

include autobuild.mk

clean:;

install:
	mkdir -p $(DESTDIR)/usr/lib/nagios/plugins-cyb
	cp plugins/* $(DESTDIR)/usr/lib/nagios/plugins-cyb/
	rsync -a etc $(DESTDIR)
	mkdir -p $(DESTDIR)/usr/bin
	cp bin/* $(DESTDIR)/usr/bin

test:
	for plugin in $(wildcard plugins/*); do ./$$plugin; done
