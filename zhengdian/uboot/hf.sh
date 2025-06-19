#!/bin/bash


export PATH=/home/hf/imx6ull/crosstools/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/bin:$PATH
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-


output_dir=/home/hf/imx6ull/zhengdian/output
cp_files=u-boot.imx
config=mx6ull_14x14_ddr256_nand_defconfig

tool_imxdownload_path=/home/hf/imx6ull/zhengdian/tools/imxdownload
sd_dev=/dev/sde1


echo "1:make ${config}"
echo "2:make menuconfig"
echo "3:compile"
echo "4:make clean"
echo "5:make distclean"
echo "6:cp ${cp_files}"
echo "7:${tool_imxdownload_path} ${PWD}/u-boot.bin ${sd_dev}"

read -p "input num:" num

if [ 1 -eq ${num} ]; then
    echo "make ${config}"
    make ${config}
elif [ 2 -eq ${num} ]; then
    echo "make menuconfig"
    make menuconfig
elif [ 3 -eq ${num} ]; then
    echo "make"
    make 
elif [ 4 -eq ${num} ]; then
    echo "make clean"
    make clean
elif [ 5 -eq ${num} ]; then
    echo "make distclean"
    make distclean
elif [ 6 -eq ${num} ]; then
    echo "cp ${cp_files} ${output_dir}"
    cp ${cp_files} ${output_dir}
elif [ 7 -eq ${num} ]; then
    echo "${tool_imxdownload_path} ${PWD}/u-boot.bin ${sd_dev}"
    ${tool_imxdownload_path} ${PWD}/u-boot.bin ${sd_dev}
else 
    echo "failed"
fi
