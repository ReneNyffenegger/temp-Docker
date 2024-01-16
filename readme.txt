
TODO:
  https://stackoverflow.com/questions/20995351/how-can-i-get-docker-linux-container-information-from-within-the-container-itsel
    within a container:
       cat /proc/self/cgroup                       -- /proc/self/cgroup seems working with cgroupV1 but won't be there hosted in cgroupV2.
       cat /proc/self/mountinfo                    --  will still have the container id for cgroupV2, however, the mount point will have different values by different container runtimes.
  
       basename $(cat /proc/1/cpuset)              -- returns the container id? 


sa:
  https://github.com/ReneNyffenegger/temp-virtualization
