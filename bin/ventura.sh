docker run -it \
    --device /dev/kvm \
    -v "/mnt/nvme2/virt/macos-13/mac_hdd_ng.img:/image" \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY:-:0.0}" \
    -e RAM=8 \
    -e CPU_STRING=8 \
    sickcodes/docker-osx:naked
