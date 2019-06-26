# DevOps with Docker - Part 1

##Contents
[1.1](#exercise-11)
[1.2](#exercise-12)
[1.3](#exercise-13)
[1.4](#exercise-14)
[1.5](#exercise-15)
[1.6](#exercise-16)
[1.7](#exercise-17)
[1.8](#exercise-18)
[1.9](#exercise-19)
[1.10](#exercise-110)
[1.10](#exercise-111)
[1.10](#exercise-112)
[1.10](#exercise-113)
[1.10](#exercise-114)
[1.10](#exercise-115)
[1.10](#exercise-116)

##Exercise 1.1
177fb9656182        nginx                   "nginx -g 'daemon of…"   About a minute ago   Exited (0) 37 seconds ago                       clever_taussig
5cf60a294e6b        nginx                   "nginx -g 'daemon of…"   About a minute ago   Exited (0) 37 seconds ago                       friendly_wilson
9bb2294fb974        nginx                   "nginx -g 'daemon of…"   About a minute ago   Up About a minute           80/tcp              keen_pike

##Excercise 1.2
[Contents](#contents)
### I have other work related images / containers on my computer, so I grep the output for nginx images only
### instead of listing them all here and cluttering the output.

syyspe@debian95:/mnt/devt/DevOps$ docker ps -a | grep nginx
177fb9656182        nginx                   "nginx -g 'daemon of…"   5 minutes ago       Exited (0) 4 minutes ago                        clever_taussig
5cf60a294e6b        nginx                   "nginx -g 'daemon of…"   5 minutes ago       Exited (0) 4 minutes ago                        friendly_wilson
9bb2294fb974        nginx                   "nginx -g 'daemon of…"   5 minutes ago       Exited (0) 18 seconds ago                       keen_pike

syyspe@debian95:/mnt/devt/DevOps$ docker rm 177fb9656182 5cf60a294e6b 9bb2294fb974
177fb9656182
5cf60a294e6b
9bb2294fb974

syyspe@debian95:/mnt/devt/DevOps$ docker images | grep nginx
nginx                                     latest              719cd2e3ed04        8 days ago          109MB
syyspe@debian95:/mnt/devt/DevOps$ docker rmi 719cd2e3ed04
Untagged: nginx:latest
Untagged: nginx@sha256:bdbf36b7f1f77ffe7bd2a32e59235dff6ecf131e3b6b5b96061c652f30685f3a
Deleted: sha256:719cd2e3ed04781b11ed372ec8d712fac66d5b60a6fb6190bf76b7d18cb50105
Deleted: sha256:e9b6506fb887de50972aefd99d7c5eb56b1a8e757ed953cdfecb86b5359bcb22
Deleted: sha256:55d9d9692a9615a28d183a42bc3881a72a39393feba3664e669e7affb78daa76
Deleted: sha256:cf5b3c6798f77b1f78bf4e297b27cfa5b6caa982f04caeb5de7d13c255fd7a1e

syyspe@debian95:/mnt/devt/DevOps$ docker ps -a | grep nginx
syyspe@debian95:/mnt/devt/DevOps$ docker images | grep nginx
syyspe@debian95:/mnt/devt/DevOps$

##Excercise 1.3
[Contents](#contents)
 syyspe@debian95:/mnt/devt/DevOps$ docker run -it --rm devopsdockeruh/pull_exercise
Give me the password: basics
You found the correct password. Secret message is:
"This is the secret message"


##Excercise 1.4
[Contents](#contents)
### Secret message: "Docker is easy"
### Commands:
syyspe@debian95:/mnt/devt/DevOps$ docker run -d --name ex14 devopsdockeruh/exec_bash_exercise
Unable to find image 'devopsdockeruh/exec_bash_exercise:latest' locally
latest: Pulling from devopsdockeruh/exec_bash_exercise
741437d97401: Pull complete
34d8874714d7: Pull complete
0a108aa26679: Pull complete
7f0334c36886: Pull complete
65c95cb8b3be: Pull complete
a36b708560f8: Pull complete
4090f912e6c7: Pull complete
ce5fe2607c2e: Pull complete
9400f5f657d6: Pull complete
c4919883f7fa: Pull complete
Digest: sha256:c463832132d1fb0b8b3b60348a6fc36fda7512a4ef2d1050e8bea7b6a6d7a2f3
Status: Downloaded newer image for devopsdockeruh/exec_bash_exercise:latest
ae4c926bbc37e564d8b3ba631cbf6fd5406aafe3d8686ebf873c5fc32b91fc5b

syyspe@debian95:/mnt/devt/DevOps$ docker ps
CONTAINER ID        IMAGE                               COMMAND             CREATED             STATUS              PORTS               NAMES
ae4c926bbc37        devopsdockeruh/exec_bash_exercise   "node index"        31 seconds ago      Up 28 seconds                           ex14

syyspe@debian95:/mnt/devt/DevOps$ docker exec -it ex14 bash
root@ae4c926bbc37:/usr/app# tail -f ./logs.txt
Wed, 19 Jun 2019 18:41:08 GMT
Wed, 19 Jun 2019 18:41:11 GMT
Wed, 19 Jun 2019 18:41:14 GMT
Wed, 19 Jun 2019 18:41:17 GMT
Secret message is:
"Docker is easy"
read escape sequence
syyspe@debian95:/mnt/devt/DevOps$ docker kill ex14

##Excercise 1.5
[Contents](#contents)
syyspe@debian95:/mnt/devt/DevOps$ docker run -it --name ex15 fav_distro:xenial sh -c 'apt-get update; apt-get install curl; read -p "Input website:"  website; echo "Searching..."; sleep 1; curl http://$website'
Get:1 http://archive.ubuntu.com/ubuntu xenial InRelease [247 kB]
Get:2 http://security.ubuntu.com/ubuntu 

*<... removed a lot of updating & curl installation ...>*

148 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
Input website:helsinki.fi
Searching...
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="http://www.helsinki.fi/">here</a>.</p>
</body></html>
syyspe@debian95:/mnt/devt/DevOps$

##Excercise 1.6
[Contents](#contents)
###Dockerfile in folder [ex16](ex16)

syyspe@debian95:/mnt/devt/DevOps/ex16$ docker pull devopsdockeruh/overwrite_cmd_exercise
Using default tag: latest
latest: Pulling from devopsdockeruh/overwrite_cmd_exercise
e79bb959ec00: Pull complete
d4b7902036fe: Pull complete
1b2a72d4e030: Pull complete
d54db43011fd: Pull complete
69d473365bb3: Pull complete
6e2490ee2dc8: Pull complete
727ad86f629c: Pull complete
23840d79cb44: Pull complete
4cfc73104030: Pull complete
68e8fecd059c: Pull complete
5746e9d6f35a: Pull complete
Digest: sha256:0c2a9eb2e7dc97e9217abbd13d6c45767cc09f7e82b7dce113fe2322161f38a6
Status: Downloaded newer image for devopsdockeruh/overwrite_cmd_exercise:latest

syyspe@debian95:/mnt/devt/DevOps/ex16$ docker run -it devopsdockeruh/overwrite_cmd_exercise

-h,             --help                  to show this message
-a [age],       --adult [age]           to check if you're older than 18
-c [time],      --clock [time]          to start a clock
-t [size],      --triangle [size]       to draw a triangle, takes second argument as the size

syyspe@debian95:/mnt/devt/DevOps/ex16$

###OK, create Dockerfile that gives --clock as param for the base image command:
ENTRYPOINT ["./start.sh"] *(this spied from docker hub)*
###=> my Dockerfile contents (Dockerfile in folder ex16):
FROM devopsdockeruh/overwrite_cmd_exercise 
CMD ["--clock"]

syyspe@debian95:/mnt/devt/DevOps/ex16$ docker build -t ex16 .
Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM devopsdockeruh/overwrite_cmd_exercise
 ---> 0f7f459b76c9
Step 2/2 : CMD ["--clock"]
 ---> Running in 020028ecf0d9
Removing intermediate container 020028ecf0d9
 ---> 38c620c71c58
Successfully built 38c620c71c58
Successfully tagged ex16:latest

syyspe@debian95:/mnt/devt/DevOps/ex16$ docker run --name ex16 ex16
1
2
3
4
*<...>*
###Kill it in another terminal:
syyspe@debian95:/mnt/devt/DevOps$ docker kill ex16


syyspe@debian95:/mnt/devt/DevOps/ex16$ docker build -t docker-clock .
Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM devopsdockeruh/overwrite_cmd_exercise
 ---> 0f7f459b76c9
Step 2/2 : CMD ["--clock"]
 ---> Using cache
 ---> 38c620c71c58
Successfully built 38c620c71c58
Successfully tagged docker-clock:latest

syyspe@debian95:/mnt/devt/DevOps/ex16$ docker run docker-clock
1
2
3
*<...>*

##Excercise 1.7
###Dockerfile and shell script in folder [ex17](ex17)
[Contents](#contents)
syyspe@debian95:/mnt/devt/DevOps/ex17$ docker build -t curler .
Sending build context to Docker daemon  3.072kB
Step 1/6 : FROM ubuntu:16.04
 ---> 13c9f1285025
Step 2/6 : RUN apt-get update && apt-get install -y curl
 ---> Running in 1fa66d5f31f9
Get:1 http://security.ubuntu.com/ubuntu xenial-security InRelease [109 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial InRelease [247 kB]

*<... removed a lot of updating & curl installation ...>*

Updating certificates in /etc/ssl/certs...
148 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
Removing intermediate container 1fa66d5f31f9
 ---> c7a14578ead7
Step 3/6 : RUN mkdir /code
 ---> Running in 95be72bcab3e
Removing intermediate container 95be72bcab3e
 ---> 4f2f894c848c
Step 4/6 : WORKDIR /code
 ---> Running in 4971707b67f1
Removing intermediate container 4971707b67f1
 ---> a2f68346f116
Step 5/6 : COPY start.sh /code/
 ---> c78a19e08bf2
Step 6/6 : ENTRYPOINT [ "/code/start.sh" ]
 ---> Running in 555f111f86d2
Removing intermediate container 555f111f86d2
 ---> 78e45ca41511
Successfully built 78e45ca41511
Successfully tagged curler:latest
syyspe@debian95:/mnt/devt/DevOps/ex17$ docker run -it --rm curler
Input website: helsinki.fi
Searching...
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="http://www.helsinki.fi/">here</a>.</p>
</body></html>
syyspe@debian95:/mnt/devt/DevOps/ex17$

##Excercise 1.8
[Contents](#contents)

syyspe@debian95:/mnt/devt/DevOps/ex17$ docker pull devopsdockeruh/first_volume_exercise
Using default tag: latest
latest: Pulling from devopsdockeruh/first_volume_exercise
741437d97401: Pull complete
34d8874714d7: Pull complete
0a108aa26679: Pull complete
7f0334c36886: Pull complete
65c95cb8b3be: Pull complete
a36b708560f8: Pull complete
4090f912e6c7: Pull complete
ce5fe2607c2e: Pull complete
9400f5f657d6: Pull complete
3ccbeb634bca: Pull complete
Digest: sha256:0fe91ae116a340214cf013541bd311da7196d34a468e9daf74a8d0fdd3419c78
Status: Downloaded newer image for devopsdockeruh/first_volume_exercise:latest
syyspe@debian95:/mnt/devt/DevOps/ex17$ cd ..
syyspe@debian95:/mnt/devt/DevOps$ mkdir ex18
syyspe@debian95:/mnt/devt/DevOps$ cd ex18
syyspe@debian95:/mnt/devt/DevOps/ex18$ docker run -it --rm devopsdockeruh/first_volume_exercise
(node:1) ExperimentalWarning: The fs.promises API is experimental
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
^CClosing file
syyspe@debian95:/mnt/devt/DevOps/ex18$ touch logs.txt
syyspe@debian95:/mnt/devt/DevOps/ex18$ docker run -v $(pwd)/logs.txt:/usr/app/logs.txt -it --rm devopsdockeruh/first_volume_exercise
(node:1) ExperimentalWarning: The fs.promises API is experimental
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
Wrote to file /usr/app/logs.txt
^CClosing file
syyspe@debian95:/mnt/devt/DevOps/ex18$ ll
total 1
drwxrwxrwx 1 root root  0 Jun 20 10:30 .
drwxrwxrwx 1 root root  0 Jun 20 10:20 ..
-rwxrwxrwx 1 root root 90 Jun 20 10:30 logs.txt
syyspe@debian95:/mnt/devt/DevOps/ex18$ cat logs.txt
Thu, 20 Jun 2019 07:30:32 GMT
Thu, 20 Jun 2019 07:30:35 GMT
Thu, 20 Jun 2019 07:30:38 GMT
syyspe@debian95:/mnt/devt/DevOps/ex18$

##Excercise 1.9
[Contents](#contents)
###Message: Ports configured correctly!!

syyspe@debian95:/mnt/devt/DevOps/ex19$ docker run -it -p 80:80 --rm devopsdockeruh/ports_exercise:latest
Unable to find image 'devopsdockeruh/ports_exercise:latest' locally
latest: Pulling from devopsdockeruh/ports_exercise
cd784148e348: Pull complete
9abca35fefbf: Pull complete
7fc670963d22: Pull complete
893040f9bc16: Pull complete
b0ae6401e570: Pull complete
Digest: sha256:2ff93dd0c744aee7a8f00bc9558d09fd6279493da0d01769fe600f78fb4593f2
Status: Downloaded newer image for devopsdockeruh/ports_exercise:latest

> ports_exercise@1.0.0 start /usr/app
> node index.js

Listening on port 80, this means inside of the container. Use -p to map the port to a port of your local machine.
^Csyyspe@debian95:/mnt/devt/DevOps/ex19$

##Excerise 1.10
[Contents](#contents)
###I used node:10-stretch image from docker hub, as there was no requirements 
###or instructions as to what image use as base. NOTE: I did 1.11 using ubuntu:16.04 as base :) 
###Dockerfile in folder [ex110](ex110)
###Message: Exercise 1.10: Congratulations! You configured your ports correctly!

syyspe@debian95:/mnt/devt/DevOps/ex110$ git clone https://github.com/docker-hy/frontend-example-docker.git .
Cloning into '.'...
remote: Enumerating objects: 133, done.
remote: Total 133 (delta 0), reused 0 (delta 0), pack-reused 133
Receiving objects: 100% (133/133), 156.31 KiB | 0 bytes/s, done.
Resolving deltas: 100% (58/58), done.
syyspe@debian95:/mnt/devt/DevOps/ex110$ 
###=>created Dockerfile (available in folder [ex110](ex110))
syyspe@debian95:/mnt/devt/DevOps/ex110$ ll
total 366
drwxrwxrwx 1 root root   4096 Jun 20 11:51 .
drwxrwxrwx 1 root root   4096 Jun 20 11:50 ..
-rwxrwxrwx 1 root root    139 Jun 20 11:50 config.js
-rwxrwxrwx 1 root root    108 Jun 20 11:53 Dockerfile
drwxrwxrwx 1 root root   4096 Jun 20 11:50 .git
-rwxrwxrwx 1 root root    978 Jun 20 11:50 .gitignore
-rwxrwxrwx 1 root root   1693 Jun 20 11:50 package.json
-rwxrwxrwx 1 root root 354385 Jun 20 11:50 package-lock.json
-rwxrwxrwx 1 root root   1329 Jun 20 11:50 README.md
drwxrwxrwx 1 root root      0 Jun 20 11:50 src
drwxrwxrwx 1 root root      0 Jun 20 11:50 util
-rwxrwxrwx 1 root root   1708 Jun 20 11:50 webpack.config.js
###=>build
syyspe@debian95:/mnt/devt/DevOps/ex110$ docker build -t ex110 .
Sending build context to Docker daemon  626.7kB
Step 1/6 : FROM node:10-stretch
10-stretch: Pulling from library/node
6f2f362378c5: Pull complete
494c27a8a6b8: Pull complete
7596bb83081b: Pull complete
372744b62d49: Pull complete
615db220d76c: Pull complete
afaefeaac9ee: Pull complete
0be21b88d1bd: Pull complete
707f080d8674: Pull complete
7cd6fdb97802: Pull complete
Digest: sha256:faf7dd4a26460ac70e3fe591752548003f0f38b3d4021ad2496accf73685219d
Status: Downloaded newer image for node:10-stretch
 ---> e05cbde47b8f
Step 2/6 : RUN mkdir /code
 ---> Running in fc56380cfe29
Removing intermediate container fc56380cfe29
 ---> d4212aeee707
Step 3/6 : WORKDIR /code
 ---> Running in a47e19de8ab5
Removing intermediate container a47e19de8ab5
 ---> 7f31bb3d9f57
Step 4/6 : COPY . /code/
 ---> e00f03971d2c
Step 5/6 : RUN npm install
 ---> Running in a985965a899f
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.7 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.7: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

added 1029 packages from 415 contributors and audited 11636 packages in 31.506s
found 6 vulnerabilities (4 moderate, 2 high)
  run `npm audit fix` to fix them, or `npm audit` for details
Removing intermediate container a985965a899f
 ---> 17ce28364459
Step 6/6 : CMD ["npm", "start"]
 ---> Running in 8e3502101021
Removing intermediate container 8e3502101021
 ---> 62b5f49ccd48
Successfully built 62b5f49ccd48
Successfully tagged ex110:latest
###=>run
syyspe@debian95:/mnt/devt/DevOps/ex110$ docker run -it -p 5000:5000 --rm ex110:latest

> frontend-example-docker@1.0.0 start /code
> webpack --mode production && serve -s -l 5000 dist

*<... warnings etc. output removed...>*

   ┌────────────────────────────────────────────────┐
   │                                                │
   │   Serving!                                     │
   │                                                │
   │   - Local:            http://localhost:5000    │
   │   - On Your Network:  http://172.17.0.2:5000   │
   │                                                │
   └────────────────────────────────────────────────┘

^C
INFO: Gracefully shutting down. Please wait...
syyspe@debian95:/mnt/devt/DevOps/ex110$ 

##Excercise 1.11
[Contents](#contents)
###In this excercise I used ubuntu:16.04 as base image, and installed all the required stuff via Dockerfile.
###Dockerfile available in available in [folder ex111](ex111)
###Message: Port configured correctly, generated message in logs.txt 

syyspe@debian95:/mnt/devt/DevOps/ex111$ git clone https://github.com/docker-hy/backend-example-docker .
Cloning into '.'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 87 (delta 0), reused 0 (delta 0), pack-reused 84
Unpacking objects: 100% (87/87), done.
syyspe@debian95:/mnt/devt/DevOps/ex111$
###=>created Dockerfile (available in [folder ex111](ex111))
syyspe@debian95:/mnt/devt/DevOps/ex111$ ll
total 228
drwxrwxrwx 1 root root   4096 Jun 20 13:12 .
drwxrwxrwx 1 root root   4096 Jun 20 13:08 ..
-rwxrwxrwx 1 root root    508 Jun 20 13:09 config.js
-rwxrwxrwx 1 root root    262 Jun 20 13:31 Dockerfile
drwxrwxrwx 1 root root   4096 Jun 20 13:09 .git
-rwxrwxrwx 1 root root    982 Jun 20 13:09 .gitignore
-rwxrwxrwx 1 root root    100 Jun 20 13:09 index.js
-rwxrwxrwx 1 root root      1 Jun 20 13:09 logs.txt
-rwxrwxrwx 1 root root   1229 Jun 20 13:09 package.json
-rwxrwxrwx 1 root root 210231 Jun 20 13:09 package-lock.json
-rwxrwxrwx 1 root root   1368 Jun 20 13:09 README.md
drwxrwxrwx 1 root root   4096 Jun 20 13:09 server
syyspe@debian95:/mnt/devt/DevOps/ex111$
###=>run
syyspe@debian95:/mnt/devt/DevOps/ex111$ touch logs.txt
syyspe@debian95:/mnt/devt/DevOps/ex111$ docker run -it -v $(pwd)/logs.txt:/code/logs.txt -p 8000:8000 --rm ex112:latest

> backend-example-docker@1.0.0 start /code
> cross-env NODE_ENV=production node index.js

Browserslist: caniuse-lite is outdated. Please run next command `npm update caniuse-lite browserslist`
Started on port 8000
^Csyyspe@debian95:/mnt/devt/DevOps/ex111$ ll
total 228
drwxrwxrwx 1 root root   4096 Jun 20 13:12 .
drwxrwxrwx 1 root root   4096 Jun 20 13:08 ..
-rwxrwxrwx 1 root root    508 Jun 20 13:09 config.js
-rwxrwxrwx 1 root root    275 Jun 20 13:41 Dockerfile
drwxrwxrwx 1 root root   4096 Jun 20 13:09 .git
-rwxrwxrwx 1 root root    982 Jun 20 13:09 .gitignore
-rwxrwxrwx 1 root root    100 Jun 20 13:09 index.js
-rwxrwxrwx 1 root root     53 Jun 20 13:46 logs.txt
-rwxrwxrwx 1 root root   1229 Jun 20 13:09 package.json
-rwxrwxrwx 1 root root 210231 Jun 20 13:09 package-lock.json
-rwxrwxrwx 1 root root   1368 Jun 20 13:09 README.md
drwxrwxrwx 1 root root   4096 Jun 20 13:09 server
syyspe@debian95:/mnt/devt/DevOps/ex111$ cat logs.txt

6/20/2019, 10:46:29 AM: Connection received in root
syyspe@debian95:/mnt/devt/DevOps/ex111$

##Exercise 1.12
[Contents](#contents)
###NOTE: I run docker in virtual machine, and use browser from host machine, 
###thus the use of IP address (virtual machine IP) instead of localhost
###Edited dockerfiles containing the environent variables:
###Frontend: [ex112/Dockerfile_ex110_edited](ex112/Dockerfile_ex110_edited)
###Backend: [ex112/Dockerfile_ex111_edited](ex112/Dockerfile_ex111_edited)

###=>rebuild backend with env variable set in Dockerfile
syyspe@debian95:/mnt/devt/DevOps/ex111$ docker build -t ex111 .
Sending build context to Docker daemon  669.2kB
Step 1/11 : FROM ubuntu:16.04
 ---> 13c9f1285025
Step 2/11 : RUN apt-get update && apt-get install -y curl
 ---> Using cache
 ---> e459898c7463
Step 3/11 : RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
 ---> Using cache
 ---> 41f1888b86cf
Step 4/11 : RUN apt-get update && apt-get install -y nodejs
 ---> Using cache
 ---> 77c43f87e6e1
Step 5/11 : RUN mkdir /code/
 ---> Using cache
 ---> 22924f0cf968
Step 6/11 : WORKDIR /code/
 ---> Using cache
 ---> 377c6583bb6e
Step 7/11 : COPY . /code/
 ---> fed25e494360
Step 8/11 : RUN npm install
 ---> Running in dbf66b83c26c

*<... npm install output ...>*

Removing intermediate container dbf66b83c26c
 ---> c24b9d2142ab
Step 9/11 : ENV FRONT_URL=http://192.168.116.130:5000
 ---> Running in 8f3b81f5743a
Removing intermediate container 8f3b81f5743a
 ---> d65af239ac28
Step 10/11 : EXPOSE 8000
 ---> Running in 2ebfc9643f51
Removing intermediate container 2ebfc9643f51
 ---> 9010e8dfa51a
Step 11/11 : CMD ["npm", "start"]
 ---> Running in 6f9654fecf8a
Removing intermediate container 6f9654fecf8a
 ---> ac639bc1c0d9
Successfully built ac639bc1c0d9
Successfully tagged ex111:latest

###=>rebuild frontend with env variable set in Dockerfile
syyspe@debian95:/mnt/devt/DevOps/ex110$ docker build -t ex110 .
Sending build context to Docker daemon  626.7kB
Step 1/8 : FROM node:10-stretch
 ---> e05cbde47b8f
Step 2/8 : RUN mkdir /code
 ---> Using cache
 ---> c2196e233505
Step 3/8 : WORKDIR /code
 ---> Using cache
 ---> 1aef38209eef
Step 4/8 : COPY . /code/
 ---> 650b3c0e9a38
Step 5/8 : RUN npm install
 ---> Running in 860e77c5bb49

*<... npm install output ...>*

Removing intermediate container 860e77c5bb49
 ---> 3b5ee448215e
Step 6/8 : EXPOSE 5000
 ---> Running in 15f42512fdae
Removing intermediate container 15f42512fdae
 ---> 85cb66869536
Step 7/8 : ENV API_URL=http://192.168.116.130:8000
 ---> Running in 4e35a80810e3
Removing intermediate container 4e35a80810e3
 ---> 73dcee8cec21
Step 8/8 : CMD ["npm", "start"]
 ---> Running in 5b45b2cb0d07
Removing intermediate container 5b45b2cb0d07
 ---> cda35c1952b3
Successfully built cda35c1952b3
Successfully tagged ex110:latest

###=>run backend
syyspe@debian95:/mnt/devt/DevOps/ex111$ docker run -it -d -v $(pwd)/logs.txt:/code/logs.txt -p 8000:8000 --name ex111 --rm ex111:latest
###=>run frontend
syyspe@debian95:/mnt/devt/DevOps/ex112$ docker run -it -d -p 5000:5000 --name ex110 --rm ex110:latest

##Excercise 1.13
[Contents](#contents)
###Dockerfile in [folder ex113](ex113)
###message: <Press here>
###         Success

###=>clone
syyspe@debian95:/mnt/devt/DevOps/ex113$ git clone https://github.com/docker-hy/spring-example-project.git .
Cloning into '.'...
remote: Enumerating objects: 36, done.
remote: Counting objects: 100% (36/36), done.
remote: Compressing objects: 100% (22/22), done.
remote: Total 36 (delta 4), reused 36 (delta 4), pack-reused 0
Unpacking objects: 100% (36/36), done.

###=>created dockerfile
syyspe@debian95:/mnt/devt/DevOps/ex113$ ll
total 31
drwxrwxrwx 1 root root 4096 Jun 20 14:57 .
drwxrwxrwx 1 root root 4096 Jun 20 14:56 ..
-rwxrwxrwx 1 root root  151 Jun 20 15:11 Dockerfile
drwxrwxrwx 1 root root 4096 Jun 20 14:56 .git
-rwxrwxrwx 1 root root  722 Jun 20 14:56 .gitignore
drwxrwxrwx 1 root root    0 Jun 20 14:56 .mvn
-rwxrwxrwx 1 root root 9113 Jun 20 14:56 mvnw
-rwxrwxrwx 1 root root 5810 Jun 20 14:56 mvnw.cmd
-rwxrwxrwx 1 root root 1780 Jun 20 14:56 pom.xml
-rwxrwxrwx 1 root root  248 Jun 20 14:56 README.md
drwxrwxrwx 1 root root    0 Jun 20 14:56 src
syyspe@debian95:/mnt/devt/DevOps/ex113$

###=>build
syyspe@debian95:/mnt/devt/DevOps/ex113$ docker build -t ex113 .

###=>run
syyspe@debian95:/mnt/devt/DevOps/ex113$ docker run -it -p 8080:8080 --name ex113 --rm ex113

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.1.3.RELEASE)

*<...>*

##Excercise 1.14
[Contents](#contents)
###Dockerfile available in [folder ex114](ex114)
###message:New Press
###        Total presses 4 *<...>*

###=>clone
syyspe@debian95:/mnt/devt/DevOps/ex114$ git clone https://github.com/docker-hy/rails-example-project.git .
Cloning into '.'...
remote: Enumerating objects: 114, done.
remote: Counting objects: 100% (114/114), done.
remote: Compressing objects: 100% (96/96), done.
remote: Total 114 (delta 4), reused 114 (delta 4), pack-reused 0
Receiving objects: 100% (114/114), 27.01 KiB | 0 bytes/s, done.
Resolving deltas: 100% (4/4), done.
syyspe@debian95:/mnt/devt/DevOps/ex114$

###=>created dockerfile
syyspe@debian95:/mnt/devt/DevOps/ex114$ ll
total 41
drwxrwxrwx 1 root root 4096 Jun 20 15:35 .
drwxrwxrwx 1 root root 4096 Jun 20 15:31 ..
drwxrwxrwx 1 root root 4096 Jun 20 15:32 app
drwxrwxrwx 1 root root    0 Jun 20 15:32 bin
drwxrwxrwx 1 root root 4096 Jun 20 15:32 config
-rwxrwxrwx 1 root root  130 Jun 20 15:32 config.ru
drwxrwxrwx 1 root root    0 Jun 20 15:32 db
-rwxrwxrwx 1 root root  410 Jun 20 16:03 Dockerfile
*<...>*

###=>build
syyspe@debian95:/mnt/devt/DevOps/ex114$ docker build -t ex114 .
Sending build context to Docker daemon  233.5kB
Step 1/13 : FROM ruby:2.6.0
 ---> ef8778f370d5
Step 2/13 : RUN apt-get update && apt-get install -y curl
*<...>*

###=>run
syyspe@debian95:/mnt/devt/DevOps/ex114$ docker run -it -p 3000:3000 --name ex114 --rm ex114:latest
=> Booting Puma
=> Rails 5.2.2.1 application starting in development
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.12.0 (ruby 2.6.0-p0), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://0.0.0.0:3000
Use Ctrl-C to stop
Started GET "/" for 192.168.116.1 at 2019-06-20 13:06:21 +0000
*<...>*

##Excercise 1.15
[Contents](#contents)
###Docker repository: https://cloud.docker.com/repository/registry-1.docker.io/syysmeri/ex115

##Excercise 1.16
[Contents](#contents)
###App in heroku: https://ex116.herokuapp.com/