#!/bin/bash

GV_url="http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-0.10.36.tar.bz2"

GV_depend=(
	"gstreamer"
	"glib"
	"libogg"
	"libtheora"
	"libvorbis"
	"liborc"
	"libvisual"
	"libxml2"
	"zlib"
)

FU_tools_get_names_from_url
FU_tools_installed "gstreamer-plugins-base-0.10.pc"

if [ $? == 1 ]; then
	
	FU_tools_check_depend

#	export LIBS="-lpthread -ldl -lXv -lXau -lXext -lX11 -lxcb"
	export LIBS="-lz -lpthread -llzma -lgcrypt -lgpg-error -lcrypto -ldl -lresolv -lm -lXv -lXext -lX11 -lxcb -lXau -lxml2"

	GV_args=(
		"--host=${GV_host}"
		"--program-prefix=${UV_target}-"
		"--libdir=${UV_sysroot_dir}/lib"
		"--includedir=${UV_sysroot_dir}/include"
		"--enable-shared"
		"--disable-static"
		"--disable-nls"
		"--disable-examples"
		"--disable-largefile"
		"--disable-gtk-doc"
		"--disable-app"
	)
	
	FU_file_get_download
	FU_file_extract_tar
		
	FU_build_configure	
	FU_build_make
	FU_build_install "install-strip"
	
	unset LIBS
	
fi