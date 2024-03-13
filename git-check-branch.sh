#!/usr/bin/env bash

# Save the regex input as a branch pattern variable
branch_pattern=$1

# Check that the branch pattern is not empty
# If it is, print an error message and exit
if [ -z "$branch_pattern" ]; then
  echo "Error: No branch pattern provided"
  exit 1
fi

# Check that the branch regex pattern matches any local branches
# If it does and the branch pattern matches only one branch, check it out
# If it does and the branch pattern matches multiple branches, print the list of branches and exit
# If it does not, repeat the process for remote branches
# If the branch pattern matches no branches, print an error message and exit
if [ $(git branch | grep -Ei "$branch_pattern" | wc -l) -eq 1 ]; then
  git checkout $(git branch | grep -Ei "$branch_pattern")
elif [ $(git branch | grep -Ei "$branch_pattern" | wc -l) -gt 1 ]; then
  echo "Error: Multiple local branches match the pattern"
  git branch | grep -Ei "$branch_pattern"
  exit 1
elif [ $(git branch -r | grep -Ei "$branch_pattern" | wc -l) -eq 1 ]; then
  git checkout --track $(git branch -r | grep -Ei "$branch_pattern")
elif [ $(git branch -r | grep -Ei "$branch_pattern" | wc -l) -gt 1 ]; then
  echo "Error: Multiple remote branches match the pattern"
  git branch -r | grep -Ei "$branch_pattern"
  exit 1
else
  echo "Error: No branches match the pattern"
  exit 1
fi
