#!/bin/bash

GV_url="https://gstreamer.freedesktop.org/src/orc/orc-0.4.19.tar.gz"
GV_sha1="6186a6a5faefe6b61d55e5406c7365d69b91c982"

GV_depend=()

FU_tools_get_names_from_url
FU_tools_installed "orc-0.4.pc"

if [ $? == 1 ]; then
	
	FU_tools_check_depend

	GV_args=(
		"--host=${GV_host}"
		"--prefix=${GV_prefix}" 
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
	FU_build_finishinstall
fi

export CFLAGS="${CFLAGS} -I${UV_sysroot_dir}/include/orc-0.4"
export CPPFLAGS=$CFLAGS
export CXXFLAGS=$CFLAGS
