#!/bin/bash


export PATH=/home/hf/imx6ull/crosstools/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/bin:$PATH
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-


output_dir=/home/hf/imx6ull/zhengdian/output
config=defconfig

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
