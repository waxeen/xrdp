
DESTDIR = /usr/local/xrdp
CFGDIR = /etc/xrdp
PIDDIR = /var/run
MANDIR = /usr/local/man
DOCDIR = /usr/doc/xrdp

all: world

world: base
	make -C sesman

base:
	make -C vnc
	make -C libxrdp
	make -C xrdp
	make -C rdp
	make -C xup

nopam: base
	make -C sesman nopam

kerberos: base
	make -C sesman kerberos

clean:
	make -C vnc clean
	make -C libxrdp clean
	make -C xrdp clean
	make -C rdp clean
	make -C sesman clean
	make -C xup clean

install:
	mkdir -p $(DESTDIR)
	mkdir -p $(CFGDIR)
	mkdir -p $(PIDDIR)
	mkdir -p $(MANDIR)
	mkdir -p $(DOCDIR)
	make -C vnc install
	make -C libxrdp install
	make -C xrdp install
	make -C rdp install
	make -C sesman install
	make -C xup install
	make -C docs install
	install instfiles/pam.d/sesman /etc/pam.d/sesman
	install instfiles/xrdpstart.sh $(DESTDIR)/xrdpstart.sh
	install instfiles/xrdp_control.sh $(DESTDIR)/xrdp_control.sh
