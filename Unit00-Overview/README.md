# Unit00 is an Example Unit for Testing
## Introduction
## Compelling Use Case
## Several Solved Examples Using Copilot
## Critical Evaluations of the Examples
## Exercises
## References

# Updating a unit

1) Do this once: Download the repository into a new directory named List-of-Units. This will create the
directory for you.

git clone --depth 1 --branch main https://github.com/Gen-AI-In-Software-Development/List-Of-Units List-Of-Units

2) Do this every time you want to work on a unit:

Make changes to the README.md file in the unit that you are working on. Avoid other units.
Here, I assume your unit has the name MyModifiedUnit.

3) You are done making changes. You now want to add and commit your changes locally.  

git add MyModifiedUnit

git commit -m "Made improvements to my unit"

4) We want to upload changes. But first, get a (possibly updated) copy of the repository.
We need to work above the directory with the unit. We want to work in the List-Of-Units Directory.
These lines are only useful if another person has updated the repo. They are OK to
do if no changes were made by another person.

git fetch origin

git merge origin/main -m "Some good commit message here"

5) Now, push the changes that you have made:

git push origin main
