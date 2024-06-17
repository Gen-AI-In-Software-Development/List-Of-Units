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

git clone --depth 1 --branch master https://github.com/Gen-AI-In-Software-Development/List-Of-Units List-Of-Units

2) Do this every time you want to work on a unit:

Make changes to the README.md file in the unit that you are working on. Avoid other units.
Here, I assume your unit has the name MyModifiedUnit.

3) You are done making changes. You now want to add and commit your changes locally. Do this from
above the directory MyModifiedUnit. 

git add MyModifiedUnit

git commit -m "Made improvements to my unit"

4) We want to upload changes. But first, get a (possibly updated) copy of the repository.
We need to work above the directory with the unit. We want to work in the List-Of-Units Directory.
These lines are only useful if another person has updated the repo. They are OK to
do if no changes were made by another person.

git fetch origin

git merge origin/master -m "Some good commit message here"

5) Now, push the changes that you have made:

git push origin master

6) Goto step 2.

RESPONSE FROM COMPUTING SERVICES

Michael,

I did some searching through the IntelliJ Plugin marketplace. Unfortunately a lot of these companies are calling their products "Copilot", but they are often completely different products.

GitHub Copilot is probably the plugin you are thinking of, as it is the flagship model for coding now. Confusingly, even though it is owned by Microsoft, GH Copilot is not the same thing as Microsoft Copilot (formerly Bing Chat Enterprise). The latter is what CMU has a license for. I cannot find any Microsoft Copilot plugins for IntelliJ.

As for whether you can use Copilot in Edge for coding, I think that could work. It depends on how the code is rendered in the browser. Copilot in Edge can be "context aware" and read the content of the currently open web page, but it does not work for ALL content. Refer to this documentation from Microsoft about what content might be "invisible" to Copilot:
https://learn.microsoft.com/en-us/DeployEdge/edge-learnmore-copilot-page-summary-results

I tested it with a private GitHub repository, and I can share what I learned. I opened a TypeScript .tsx file in the browser. Then I opened the copilot sidebar and gave an instruction to rewrite one of the functions and add a line to it. I found out that this worked but only if I explicitly said "Using the code on this page...." in my prompt.

Also a downside of this approach is that Copilot sessions are not saved, so if you accidentally close the sidebar you can lose your message history.

Finally, because you mention this being given to students in a teaching and learning context, I'd recommend reaching out to Judy Brooks at Eberly. They are implementing similar assessments of this technology in the classroom, and they may be able to help or provide some guidance.

Best,
Bo Powers
