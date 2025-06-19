#!/bin/bash


export PATH=/home/hf/imx6ull/crosstools/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/bin:$PATH
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

config=imx_alientek_nand_defconfig

output_path=/home/hf/imx6ull/zhengdian/output
copy_path=${PWD}/arch/arm/boot
file_Image=zImage
file_dtb=imx6ull-alientek-nand.dtb

echo "1:make ${config}"
echo "2:make menuconfig"
echo "3:make all -j$(nproc)"
echo "4:make clean"
echo "5:make distclean"
echo "6:make zImage"
echo "7:cp ${copy_path}/${file_Image} ${copy_path}/dts/${file_dtb} ${output_path}"

read -p "input num:" num

case "$num" in
    1) make ${config} ;;
    2) make menuconfig ;;
    3) make all -j$(nproc);;
    4) make clean ;;
    5) make distclean ;;
    6) make zImage ;;
    7) cp ${copy_path}/${file_Image} ${copy_path}/dts/${file_dtb} ${output_path} ;;
    *) echo "Invalid input, please enter valid number" ;;
esac