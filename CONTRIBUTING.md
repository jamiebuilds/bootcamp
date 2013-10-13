# Contribute to Bootcamp

> This document is a work in progress, if you see something weird or just plain stupid. First know that I copied most of it from other projects. Then submit an issue.

Please take a moment to review this document in order to make the contribution process easy and effective for everyone involved.

Following these guidelines helps to communicate that you respect the time of the developers managing and developing this open source project. In return, they should reciprocate that respect in addressing your issue, assessing changes, and helping you finalize your pull requests.

## Github Issues

Github issues for this repository is the preferred medium for bug reports and feature requests.

## Bugs

A bug is demonstrable problem caused by the code in this repository, so please take the time to make sure that it is not a bug in your own code. Good bug reports are extremely helpful and are formed by the following guidelines:

1. **Search through existing Github Issues** to make sure that your issue has not already been reported. If an issue already exists then that is the appropriate place for you to contribute.
2. **Make sure the bug has not already been fixed** by attempting to reproduce the issue with the latest version of this repository.
3. **Isolate the bug** as much as possible, the more code the more difficult it is to fix. Ideally you should create a [reduced test case](http://css-tricks.com/reduced-test-cases/).
4. **Submit bug with as much detail as possible**. Just attaching a block of code is not enough, try your best to solve the issue and detail everything you tried.

**Example Bug Report:**

> ## A Short but Descriptive Title
>
> A summary of the bug and the environment in which it occurs (Browser/OS).
>
> Please include steps to reproduce the bug.
> 1. Step One
> 2. Step Two
> 3. Step Three
>
> A link to a reduced test case `http://url.com/example`
>
> Any other information you want to share that you think is applicable to the bug. Please include some code which you believe is causing the problem, or any errors that are occurring in the console.
>
> If you think you have a solution please include it here.

## Features

Feature requests are welcome. But take a moment to find out whether your idea fits with the scope and aim of this project. It's up to you to make a strong case for any idea you have. Please provide as much detail and context as possible.

## Making Changes

First, ensure that you have the latest version of everything installed. (Node.js, npm, grunt-cli)

1. Fork and clone the repo.
2. Check out the master or latest version branch
3. Run `npm install` to install all Bootcamp dependencies
4. Run `grunt` to prepare everything

Assuming that you don't see any red, you're ready to go. Just be sure to run `grunt` after making any change, to ensure that nothing has broken.

## Pull Request

1. Create a new branch, never work on the master branch directly. Use a short but descriptive branch name (eg. `add_new_feature`, `fix_certain_bug`, `update_weird_typo`).
2. Add failing tests for the change you want to make. Run `grunt` to see the tests fail.
3. Make the change.
4. Run `grunt` to see if the tests pass. Repeat steps 2-4 until done.
5. Update the documentation to reflect any changes.
6. Push to your fork and submit a pull request.

## Syntax

- Two space indents. Don't use tabs anywhere. Use `\t` if you need a tab character in a string.
- No trailing whitespace.
- Don't go overboard with the whitespace.
- Delimit string with single-quotes `'`, except in any Sass code, use double-quotes `"`.
- Prefer `if` and `else` to ["clever"](http://programmers.stackexchange.com/questions/25276/why-is-cleverness-considered-harmful-in-programming-by-some-people/25281#25281) uses of `? :` conditional or `||`, `&&` logical operators.
- Use verbose names (`or`, `and`, `not`, `unless`, etc.) in languages that support them.
- Comments are great. Just put them _before_ the line of code, _not_ at the _end_ of the line.
- **When in doubt, follow the conventions you see used in the source already.**
