#!/usr/bin/env bats

# Sanity checks for base runtime tools

@test "node is installed" {
    run node --version
    [ "$status" -eq 0 ]
}

@test "pnpm is installed" {
    run pnpm --version
    [ "$status" -eq 0 ]
}

@test "python3 is installed" {
    run python3 --version
    [ "$status" -eq 0 ]
}

@test "azure cli is installed" {
    run az version -o tsv
    [ "$status" -eq 0 ]
}

@test "pulumi is installed" {
    run pulumi version
    [ "$status" -eq 0 ]
}

@test "kubectl is installed" {
    run kubectl version --client
    [ "$status" -eq 0 ]
}

# Project-specific tools

@test "docker is installed" {
    run docker --version
    [ "$status" -eq 0 ]
}

@test "sudo is installed" {
    run sudo --version
    [ "$status" -eq 0 ]
}

# containers.base dependency validation

@test "apply-templates is installed" {
    run apply-templates --help
    [ "$status" -eq 0 ]
}

@test "merge-xml is installed" {
    [ -x /usr/local/bin/merge-xml ]
}

# Environment configuration

@test "PULUMI_SKIP_UPDATE_CHECK is true" {
    [ "$PULUMI_SKIP_UPDATE_CHECK" = "true" ]
}
