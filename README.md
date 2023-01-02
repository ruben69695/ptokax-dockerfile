# PtokaX in Docker
This is a Dockerfile to be able to build an image of PtokaX 0.5.3.0 (20th anniversary edition) and to create a container of the image. 

Base configuration for PtokaX under config directory in `Settings.pxt` text file, to be able to bind it for the container and preserve config between container recreations or to be able to create backups. 

**Settings** has been prepared to host a **private PtokaX Direct Connect Hub**, if we want to make it public, we have to change the `Settings.pxt` file.

## 📦 Dependencies
- Docker

## ⛏️ Getting started

1. Build image
```bash
docker build -t ptokax:latest .
```

2. Create the container
```bash
docker create --name ptokax \
        -p 54400:411 \
        --mount type=bind,src=/home/rubenarrebola/Development/ptokax/config,target=/src/cfg \
        --mount type=bind,src=/home/rubenarrebola/Development/ptokax/logs,target=/src/logs \
        ptokax:latest
```

3. Start the created container
```bash
docker start ptokax
```

4. Connect to the container shell
```bash
docker exec -it ptokax bash
```

5. Create our first user using PtokaX CLI steps menu
```bash
./PtokaX -m
```

```bash
PtokaX DC Hub 0.5.3.0 built on Jan  1 2023 16:43:11

Welcome to PtokaX configuration setup.
Directory for PtokaX configuration is: /src
When this directory is wrong, then exit this setup.
To specify correct configuration directory start PtokaX with -c configdir parameter.

Available options:
1. Basic setup. Only few things required for PtokaX run.
2. Complete setup. Long setup, where you can change all PtokaX setings.
3. Add registered user.
4. Exit this setup.

Your choice: 3
Please enter Nick for new Registered User (Maximal length 64 characters. Characters |, $ and space are not allowed): ruben
Please enter Password for new Registered User (Maximal length 64 characters. Character | is not allowed): ruben123

Available profiles: 
0 - Master
1 - Operator
2 - VIP
3 - Reg
Please enter Profile number for new Registered User: 0
Registered User with Nick 'ruben' Password 'ruben123' and Profile '0' was added.

Available options:
1. Basic setup. Only few things required for PtokaX run.
2. Complete setup. Long setup, where you can change all PtokaX setings.
3. Add registered user.
4. Exit this setup.

Your choice: 4
PtokaX DC Hub 0.5.3.0 ending...
```

6. With our new user, we can connect using a client to our new hub, for example airdc++ or eiskaltdc++


## 💻 Environment
- Fedora 37
- Codium 1.74