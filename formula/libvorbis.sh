#!/bin/bash

GV_url="http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.2.tar.bz2"

GV_depend=(
	"ogg"
)

FU_tools_get_names_from_url
FU_tools_installed "vorbis.pc"

if [ $? == 1 ]; then
	
	FU_tools_check_depend
	
	export LIBS="-logg -lm"

	GV_args=(
		"--host=${GV_host}"
		"--program-prefix=${UV_target}-"
		"--libdir=${UV_sysroot_dir}/lib"
		"--includedir=${UV_sysroot_dir}/include"
		"--enable-shared"
		"--disable-static"
		"--disable-docs"
		"--disable-example"
		"--disable-oggtest"
	)
	
	FU_file_get_download
	FU_file_extract_tar
		
	FU_build_configure
	FU_build_make
	FU_build_install "install-strip"
	
	unset LIBS
fi
