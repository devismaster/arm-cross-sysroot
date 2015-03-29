#!/bin/bash

GV_url="http://liblqr.wdfiles.com/local--files/en:download-page/liblqr-1-0.4.2.tar.bz2"

GV_depend=(
	"glib"
)

FU_tools_get_names_from_url
FU_tools_installed "lqr-1.pc"

if [ $? == 1 ]; then
	
	FU_tools_check_depend

	GV_args=(
		"--host=${GV_host}"
		"--program-prefix=${UV_target}-"
		"--libdir=${UV_sysroot_dir}/lib"
		"--includedir=${UV_sysroot_dir}/include"
		"--enable-shared"
		"--disable-static"
	)
	
	FU_file_get_download
	FU_file_extract_tar
		
	FU_build_configure	
	FU_build_make
	FU_build_install "install-strip"
	
fi
