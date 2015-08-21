#/bin/sh
# XXX will change core dump path on host and all containers (at least the ones started with --privileged)
sudo bash -c "echo coredump > /proc/sys/kernel/core_pattern"

gcc main.c 

docker build -t crash .

docker run --privileged --ulimit core=1000000000000 -ti crash bash
# execute ./a.out
# have core file ./coredump.<pid>
