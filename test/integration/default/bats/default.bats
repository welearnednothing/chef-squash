#!/usr/bin/env bats

@test "nginx should be running" {
    ps aux | grep -v grep | grep nginx
}

@test "trinidad should be running" {
    ps aux | grep -v grep | grep trinidad
}
