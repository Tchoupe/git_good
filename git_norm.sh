#!/bin/bash
git status > /dev/null 2>&1
if [ $? != 0 ] ; then
    printf "\e[91mNot a git repository\033[0;0m\n"
    exit 0
fi
git for-each-ref --format='%(refname:short)' refs/heads/ | while read line ; do
	printf "\e[92mIn the $line branch :\033[0;0m\n"
    echo $line | xargs git shortlog | grep -e '^      ' | sed 's/.*Merge.*/This line contains a merge/' | awk '{printf "\033[0;91mCommit subject too long\033[0;0m : %s length : %s\n", length($0), $0}' | awk '($6 > 51 ) '
    echo $line | git log | sed 's/.*Merge.*/This line contains a merge/' | awk '{printf "\033[0;91mCommit line too long\033[0;0m : %s length : %s\n", length($0), $0}' | awk '(NR==0) || ($6 > 81 ) '
done
