:dummy-runner() {
    printf "%s\n" "${*}"
}

ssh-test:set-remote-runner :dummy-runner

tests:ensure ssh-test:remote:run-daemon
tests:assert-stdout "sshd -Dd"

tests:ensure ssh-test:remote:run-daemon -D
tests:assert-stdout "sshd -D"
