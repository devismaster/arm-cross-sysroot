#!/bin/bash

GV_url="http://xorg.freedesktop.org/releases/individual/lib/xtrans-1.2.7.tar.bz2"

GV_depend=()

FU_tools_get_names_from_url
FU_tools_installed "${LV_formula%;*}.pc"

if [ $? == 1 ]; then
	
	FU_tools_check_depend

	GV_args=(
		"--host=${GV_host}"
		"--program-prefix=${UV_target}-"
		"--libdir=${UV_sysroot_dir}/lib"
		"--includedir=${UV_sysroot_dir}/include"
		"--disable-docs"
		"--without-xmlto"
		"--without-fop"
		"--without-xsltproc"
	)
	
	FU_file_get_download
	FU_file_extract_tar
		
	FU_build_configure
	FU_build_make
	FU_build_install
	
	mv -f "${UV_sysroot_dir}/${GV_host}/share/pkgconfig/xtrans.pc" \
		"${UV_sysroot_dir}/lib/pkgconfig/"

fi
