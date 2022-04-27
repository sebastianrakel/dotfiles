#!/bin/sh

current_dir=$PWD

cd /home/sebastian/Projects/Puppet/puppet-editor-services/
echo "Project Dir: ${current_dir}"
echo "Starting LSP Server for Puppet"
bundle exec ruby ./puppet-languageserver --stdio $@
