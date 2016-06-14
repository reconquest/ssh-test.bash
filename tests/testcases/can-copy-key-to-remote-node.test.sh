:dummy-runner() {
    printf "%s\n" "${*}" >&2
    cat >&2
}

ssh-test:set-remote-runner :dummy-runner
ssh-test:set-username "test-user"

tests:ensure ssh-test:local:keygen
tests:ensure ssh-test:remote:copy-id <<< "$(cat "$(ssh-test:print-key-path).pub")"

tests:assert-stderr "tee -a /home/test-user/.ssh/authorized_keys"
tests:assert-stderr "$(cat "$(ssh-test:print-key-path).pub")"
