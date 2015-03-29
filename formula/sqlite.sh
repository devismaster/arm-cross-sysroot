#!/bin/bash

GV_url="http://sqlite.org/2014/sqlite-autoconf-3080700.tar.gz"

GV_depend=(
	"readline"
)

FU_tools_get_names_from_url
GV_version="3.8.7"
FU_tools_installed "sqlite3.pc"

if [ $? == 1 ]; then
	
	FU_tools_check_depend

	GV_args=(
		"--host=${GV_host}"
		"--program-prefix=${UV_target}-"
		"--libdir=${UV_sysroot_dir}/lib"
		"--includedir=${UV_sysroot_dir}/include"
		"--enable-shared"
		"--disable-static"
		"--disable-largefile"
		"--enable-readline"
	)
	
	FU_file_get_download
	FU_file_extract_tar
		
	FU_build_configure	
	FU_build_make
	FU_build_install "install-strip"
	
	cd "${UV_sysroot_dir}/include/"
	ln -s sqlite3.h sqlite.h
	cd $GV_base_dir
	
fi
