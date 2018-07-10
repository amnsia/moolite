# moolite
A collection of personal LambdaMOO-related things.

| name   | description   |
| ------ | ------------- |
| [install.sh](https://git.io/fNJp0) | installs [stunt](https://git.io/f4bSB), the latest [LambdaCore](https://git.io/fNJpa), and [restart.sh](https://git.io/fNJpE) (if it's in the same dir).
| [restart.sh](https://git.io/fNJpE) | uses gzip instead of compress cuz compress not installed by default on Ubuntu. |

## Quickstart

```
git clone https://github.com/amnsia/moolite && cd moolite
./install.sh
cd ~/moo/server
./restart.sh ../db/core
```

Then connect via client or telnet to change the name and password of Wizard (#2). That's you.

```
telnet localhost 7777
connect Wizard
@rename me to AmGod
@password totesecure
```

To be continued...