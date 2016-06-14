tests:ensure ssh-test:local:keygen

tests:ensure ssh-keygen -lf "$(ssh-test:print-key-path)"
