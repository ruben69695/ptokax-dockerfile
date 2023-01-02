# 🐋 PtokaX in Docker
This is a Dockerfile to be able to build an image of PtokaX 0.5.3.0 (20th anniversary edition) and to create a container of the image. 

## 📦 Dependencies
- Docker

## ℹ️ Information
- There's a default user created to be able to operate with the hub: User -> main | Password -> main123, when not needed anymore because we've created at least one master user, we can delete it with a chat command.
- PtokaX logs are stored on logs directory, this will be binded with the container, to be able to see it from host machine.
- All PtokaX configuration are under config directory, this will be binded with the container, to be able to see the settings from host machine, change settings when container is stopped, or don't lose settings when container is deleted/re-created.
- **Settings** has been prepared to host a **private PtokaX Direct Connect Hub**, if we want to make it public, we have to change the `Settings.pxt` file.

## ⚠️ Important
- If we want to change any setting from the `.pxt`, `.pxb` files, we must stop the container first. Because all manually  changed settings or using PtokaX CLI tool, when container and PtokaX main process is running are not applied on the fly and the most important, when PtokaX service or container stops the changes are overriden with the in memory values of the main process of PtokaX.

## ⛏️ HOW-TO: Build and start the container

1. Build image from dockerfile
```zsh
docker build -t ptokax:latest .
```

2. Create the container based on the image
```zsh
docker create --name ptokax \
        -p 54400:411 \
        --mount type=bind,src=/home/rubenarrebola/Development/ptokax/config,target=/src/cfg \
        --mount type=bind,src=/home/rubenarrebola/Development/ptokax/logs,target=/src/logs \
        ptokax:latest
```

3. Start the created container
```zsh
docker start ptokax
```

4. If we have to connect to the container shell, we can do it like this
```zsh
docker exec -it ptokax bash
```

## ⛏️ HOW-TO: Connect to the DC Hub

<details>
  <summary>Screenshots for connecting to hub</summary>

- We can use the airdc++, or we can use the eiskaltdc++
![Create new hub connection](https://i.imgur.com/JhM1NWp.png)
![Connect to the new hub connection](https://i.imgur.com/aMQG26Z.png)
</details>

## ⛏️ HOW-TO: See available commands

- In the hub chat, we can see a list of available commands for our user sending the message (command) **!help**
```zsh
!help
```
<details>
  <summary>Screenshots for help</summary>
  
![See available commands](https://i.imgur.com/deIkbjH.png)
</details>

## ⛏️ HOW-TO: create a user

- Before create a new user we have to understand the available profiles for the user, this declares what the user can do in the hub. The available profiles are: `master | operator | vip | reg`


- In the hub chat, with our **main** user (profile: master), we can create users directly from the chat. As we saw the !help command displays a list of commands, and the command to create new users is the next one: **!addreguser**. So if want a friend to access our hub, we can create a new user for him/her. Example:
```
!addreguser <nick> <password> <profilename>
```
```
!addreguser ruben ruben123 reg
```

## 💻 Environment
- Fedora 37
- Codium 1.74