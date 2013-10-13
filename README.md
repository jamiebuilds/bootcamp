Bootcamp [![Build Status](https://travis-ci.org/tctcl/bootcamp.png?branch=master)](https://travis-ci.org/tctcl/bootcamp) [![Dependency Status](https://david-dm.org/tctcl/bootcamp.png)](https://david-dm.org/tctcl/bootcamp) [![devDependency Status](https://david-dm.org/tctcl/bootcamp/dev-status.png)](https://david-dm.org/tctcl/bootcamp#info=devDependencies)
========

Jasmine-style BDD testing written in Sass for Sass.

#### [Read Introduction](https://github.com/tctcl/bootcamp/wiki/introduction)

#### [See Example Test Suite](https://github.com/tctcl/bootcamp/wiki/example-test-suite)

> **Note: There are some major changes coming to this project in the [0.0.3 version](https://github.com/tctcl/bootcamp/pull/28), while it's not complete, you may want to [switch to that branch](https://github.com/tctcl/bootcamp/tree/0.0.3) to test things out. Just know that not everything said in the readme and wiki are true (yet).**

## Install

In the future, Bootcamp will hopefully be available in more ways, for now you can either clone the repo yourself or install it via [bower](http://bower.io/). If you would like, please help create a [grunt plugin](http://gruntjs.com/), a [yeoman generator](http://yeoman.io/), a [ruby gem](http://rubygems.org/), or any other package manager you'd like out there.

#### Git

```
git clone git@github.com:tctcl/bootcamp.git && cd bootcamp
```

#### Bower

```
bower install bootcamp --save-dev
```

## Test File

```scss
@import "bootcamp";    // import bootcamp
@import "app";         // import your files

@include runner-start; // include runner-start
@import "specs";       // import your tests
@include runner-end;   // include runner-end
```

## License

This project is provided under the terms of the [MIT License](LICENSE.md).

---

Authored by **James Kyle** · [Github](https://github.com/thejameskyle) · [Twitter](https://twitter.com/thejameskyle) · [CodePen](https://codepen.com/thejameskyle)

Built Equal · Made in Boston
