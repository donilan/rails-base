#!/bin/bash

case ${1} in
    start)
        echo bundle exec rake assets:precompile db:create db:migrate
        bundle exec rake assets:precompile db:create db:migrate
        echo bundle exec thin start --threaded
        bundle exec thin start --threaded
        ;;
esac
