#!/bin/bash

mcmemmb=1792

for (( ; ; ))
do
        java -Xmx${mcmemmb}M `: #              Max memory allocated` \
             -Xms${mcmemmb}M `: #              Initial memory allocated` \
             -XX:+UseConcMarkSweepGC `: #      Oracle docs: "This collector should be considered for any application with a low pause time requirement."` \
             -XX:+UseParNewGC`: #              Oracle docs: "Uses a parallel version of the young generation copying collector alongside the default collector. This minimizes pauses by using all available CPUs in parallel."` \
             -XX:+CMSIncrementalMode `: #      Enables incremental garbage collection` \
             -XX:+CMSIncrementalPacing `: #    Enables automatic adjustment of the incremental mode duty cycle based on statistics collected while the JVM is running` \
             -XX:ParallelGCThreads=2 `: #      Sets the number of garbage collector threads` \
             -XX:+AggressiveOpts`: #           Enables the use of aggressive performance optimization features, which are expected to become default in upcoming releases` \
             -jar minecraft_server.jar nogui
        echo "Server closed unexpectedly, restarting in 10 seconds..."
        sleep 10
done
