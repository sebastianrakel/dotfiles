#!/usr/bin/env bash

echo "go lsp: installing"
if [ -f "${GOPATH}/bin/gopls" ]; then
    echo "go lsp: already installed"
    exit 0
fi
go install golang.org/x/tools/gopls@latest
echo "go lsp: installed"
