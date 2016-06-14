
* [ssh-test:print-key-path()](#sshtestprintkeypath)
* [ssh-test:print-username()](#sshtestprintusername)
* [ssh-test:set-key-path()](#sshtestsetkeypath)
* [ssh-test:set-remote-runner()](#sshtestsetremoterunner)
* [ssh-test:set-username()](#sshtestsetusername)
* [ssh-test:remote:run-daemon()](#sshtestremoterundaemon)
* [ssh-test:local:keygen()](#sshtestlocalkeygen)
* [ssh-test:remote:keygen()](#sshtestremotekeygen)
* [ssh-test:remote:copy-id()](#sshtestremotecopyid)
* [ssh-test:connect:by-key()](#sshtestconnectbykey)


## ssh-test:print-key-path()

Prints path to private part of generated
keypair.

### Output on stdout

* Path to private part.

_Function has no arguments._

## ssh-test:print-username()

Prints username, used for authentication.

### Output on stdout

* Username.

_Function has no arguments._

## ssh-test:set-key-path()

Sets key path to keypair generation.

### Arguments

* **$1** (string): Path.

## ssh-test:set-remote-runner()

Sets remote runner, which will be used to invoke commands
on the remote nodes. By default, they will be executed on local node.

### Arguments

* **...** (any): Command.

## ssh-test:set-username()

Sets username, which will be used for authentication.

### Arguments

* **$1** (string): Username.

## ssh-test:remote:run-daemon()

Starts sshd on the remote node.

### Arguments

* **...** (any): Arguments for the sshd. [default: -Dd]

## ssh-test:local:keygen()

Generated new keypair.

### Arguments

* **$1** (string): Path to generated keypair. [default: ./]

## ssh-test:remote:keygen()

Generates keys for the sshd.

### Arguments

* **...** (string): Arguments for ssh-keygen. [default: -A]

## ssh-test:remote:copy-id()

Copies public part of the keypair to the remote node.

Awaits public keypair on the stdin.

### Arguments

* **$1** (Username.): [default: $USER]

## ssh-test:connect:by-key()

Connects to the remote node using keypair for the
authentication.

### Arguments

* **$1** (string): Address to connect to.
* **$2** (string): Username. [default: $USER]
* **$3** (string): Path to identity. [default: ./id_rsa]

