#!/bin/bash

# /home/ubuntu/go.sh -s ${var.repo_site} -u ${var.repo_user} -p ${var.repo_password} -g ${var.app_group_id} -a ${var.app_artifact_id} -v ${var.app_version}

while getopts ":s:u:p:r:g:a:v:" opt; do
  case $opt in
    s)
      export repo_site=$OPTARG 
      echo "-a was triggered, Parameter: $repo_site" >&2
      ;;
    u)
      export repo_user=$OPTARG
      echo "-b was triggered, Parameter: $repo_user" >&2
      ;;
    p)
      export repo_password=$OPTARG
      echo "-c was triggered, Parameter: $repo_password" >&2
      ;;
    g)
      export app_group_id=$OPTARG
      echo "-e was triggered, Parameter: $app_group_id" >&2
      ;;
    a)
      export app_artifact_id=$OPTARG
      echo "-w was triggered, Parameter: $app_artifact_id" >&2
      ;;
    v)
      export app_version=$OPTARG
      echo "-g was triggered, Parameter: $app_version" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done


sudo apt -yy update
sudo apt -yy install git puppet
sudo apt -yy install ruby-bundler

git clone https://github.com/devops-studentXX/puppet.git

cd puppet
bundle
librarian-puppet install --clean
sudo FACTER_app_version=$app_version \
     FACTER_app_group_id=$app_group_id \
     FACTER_app_artifact_id=$app_artifact_id \
     FACTER_repo_site=$repo_site \
     FACTER_repo_user=$repo_user \
     FACTER_repo_password=$repo_password \
     puppet apply init.pp --modulepath modules

