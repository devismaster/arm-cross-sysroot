#!/bin/bash

GV_url="ftp://xmlsoft.org/libxml2/libxslt-1.1.27.tar.gz"

GV_depend=(
	"zlib"
	"liblzma"
	"libxml2"
	"libgcrypt"
	"libgpg-error"
)

FU_tools_get_names_from_url
FU_tools_installed "${LV_formula%;*}.pc"

if [ $? == 1 ]; then
	
	FU_tools_check_depend
	
	export LIBS="-lxml2 -ldl -lm -lz -lpthread -llzma -lgcrypt -lgpg-error"

	GV_args=(
		"--host=${GV_host}"
		"--program-prefix=${UV_target}-"
		"--libdir=${UV_sysroot_dir}/lib"
		"--includedir=${UV_sysroot_dir}/include"
		"--enable-shared"
		"--disable-static"
		"--with-crypto"
		"--without-python"
	)
	
	FU_file_get_download
	FU_file_extract_tar
		
	FU_build_configure
	FU_build_make
	FU_build_install "install-strip"
	
fi
