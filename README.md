JSHINT
----
- What is jshint:
  http://en.wikipedia.org/wiki/JSHint
- Examples:
  http://www.jshint.com/
- Documentation:
  http://www.jshint.com/docs/
- Project settings:
  see **.jshintrc**

Grunt
----
- What is grunt:
  The javascript task runner
- Why use a task runner?
  In one word: automation. The less work you have to do when performing repetitive tasks like minification, compilation, unit testing, linting, etc, the easier your job becomes. After you've configured it, a task runner can do most of that mundane work for you—and your team—with basically zero effort.
- Documentation:
  http://gruntjs.com/
- Project settings: see Gruntfile.coffee and package.json
- Which packages are integrated to this project:
> - jshint
> - sass compilation
> - livereload
> - imagemin

More info regarding each package you can find here:
http://gruntjs.com/plugins

Installation of Grunt
--------------
To run grunt you should
- install NodeJS from this url http://nodejs.org/

```sh
cd theme_folder
npm install
grunt dev
```

Sass/Scss
--------------
All styles in css/styles.css are compiled from sass folder with Grunt task runner
Sass coding settings defined for current theme you can find in **.scss-lint.yml** file


Editorconfig
--------------
- What is EditorConfig? EditorConfig helps developers define and maintain consistent coding styles between different editors and IDEs. 
- More info: http://editorconfig.org/
- Project settings: see **.editorconfig **
