#!/bin/bash

GV_url="http://www.kernel.org/pub/linux/bluetooth/bluez-5.18.tar.xz"

GV_depend=(
	"glib"
	"dbus"
)

FU_tools_get_names_from_url
FU_tools_installed "${LV_formula%;*}.pc"

if [ $? == 1 ]; then
	
	FU_tools_check_depend
	
	export LIBS="-lpthread -lc -lrt -ldl -lresolv -lncurses"

	GV_args=(
		"--host=${GV_host}"
		"--program-prefix=${UV_target}-"
		"--libdir=${UV_sysroot_dir}/lib"
		"--includedir=${UV_sysroot_dir}/include"
		"--enable-shared"
		"--disable-static"
		"--enable-threads"
		"--enable-library"
		"--disable-udev"
		"--disable-cups"
		"--disable-obex"
		"--disable-systemd"
	)
	
	FU_file_get_download
	FU_file_extract_tar
		
	FU_build_configure	
	FU_build_make
	FU_build_install "install-strip"
	
	unset LIBS
fi
