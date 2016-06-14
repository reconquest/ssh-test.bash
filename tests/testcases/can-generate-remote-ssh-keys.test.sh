ssh-keygen() {
    printf "ssh-keygen %s\n" "${*}"
}

tests:ensure ssh-test:remote:keygen
tests:assert-stdout "ssh-keygen -A"
