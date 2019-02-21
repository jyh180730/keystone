#!/usr/bin/env bash
./riscv-qemu/riscv64-softmmu/qemu-system-riscv64 \
    -D debug.log \
    -m 4G \
    -bios bootrom/bootrom.elf \
    -nographic \
    -machine virt \
    -kernel hifive-work/riscv-pk/bbl \
    -drive file=hifive-work/rootfs.bin,format=raw,id=hd0 \
    -device virtio-blk-device,drive=hd0 \
    -netdev  user,id=net0,net=192.168.100.1/24,dhcpstart=192.168.100.128,hostfwd=tcp::5555-:22 \
    -device virtio-net-device,netdev=net0
