_ssh_test_key_path="./id_rsa"
_ssh_test_username="$USER"
_ssh_test_remote_runner=":ssh-test:remote:dummy-runner"

:ssh-test:remote:dummy-runner() {
    "${@}"
}

# @description Prints path to private part of generated
# keypair.
#
# @stdout Path to private part.
# @noargs
ssh-test:print-key-path() {
    printf "$_ssh_test_key_path"
}

# @description Prints username, used for authentication.
#
# @stdout Username.
# @noargs
ssh-test:print-username() {
    printf "$_ssh_test_username"
}

# @description Sets key path to keypair generation.
#
# @arg $1 string Path.
ssh-test:set-key-path() {
    _ssh_test_key_path="$1"
}

# @description Sets remote runner, which will be used to invoke commands
# on the remote nodes. By default, they will be executed on local node.
#
# @arg $@ any Command.
ssh-test:set-remote-runner() {
    _ssh_test_remote_runner=("${@}")
}

# @description Sets username, which will be used for authentication.
#
# @arg $1 string Username.
ssh-test:set-username() {
    _ssh_test_username="$1"
}

# @description Starts sshd on the remote node.
#
# @arg $@ any Arguments for the sshd. [default: -D]
ssh-test:remote:run-daemon() {
    "${_ssh_test_remote_runner[@]}" \
        sshd "${@:--D}"
}

# @description Generated new keypair.
#
# @arg $* any Arguments for ssh-keygen. [default: -P '' -f ./id_rsa]
ssh-test:local:keygen() {
    echo 'y' | eval ssh-keygen ${@:--P \'\' -f $_ssh_test_key_path}
}

# @description Generates keys for the sshd.
#
# @arg $@ string Arguments for ssh-keygen. [default: -A]
ssh-test:remote:keygen() {
    "${_ssh_test_remote_runner[@]}" \
        ssh-keygen "${@:--A}"
}

# @description Copies public part of the keypair to the remote node.
#
# Awaits public keypair on the stdin.
#
# @arg $1 Username. [default: $USER]
ssh-test:remote:copy-id() {
    local username=${1:-$_ssh_test_username}

    "${_ssh_test_remote_runner[@]}" \
        tee -a /home/$username/.ssh/authorized_keys > /dev/null
}

# @description Connects to the remote node using keypair for the
# authentication.
#
# @arg $1 string Address to connect to.
ssh-test:connect:by-key() {
    local address="$1"
    shift 1

    ssh \
        -oStrictHostKeyChecking=no \
        -oPasswordAuthentication=no \
        -oIdentitiesOnly=yes \
        -oControlPath=none \
        -i "$_ssh_test_key_path" \
        -l "$_ssh_test_username" \
        "$address" "${@}"
}
