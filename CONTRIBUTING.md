# Contribution Guide 

There are many ways to be an open source contributor, and we're here to help you on your way! You may:

* Propose ideas in our 
  [discord](https://discord.gg/tbd)
* Raise an issue or feature request in our [issue tracker](https://github.com/TBD54566975/flutter_starter/issues)
* Help another contributor with one of their questions, or a code review
* Suggest improvements to our Getting Started documentation by supplying a Pull Request
* Evangelize our work together in conferences, podcasts, and social media spaces.

This guide is for you.

## Development Prerequisites

### Hermit
The easiest way to get started with this project is to use [Hermit](https://cashapp.github.io/hermit/usage/get-started/). We recommend installing the [shell hooks](https://cashapp.github.io/hermit/usage/shell/) to automatically switch to the correct version of Flutter and other dependencies for this project.

<details>
  <summary>Installing dependecies without hermit (the hard way)</summary>

  | Requirement | Tested Version | Installation Instructions                            |
|-------------|----------------|------------------------------------------------------|
| Flutter     | 3.16.5         |[flutter.dev](https://docs.flutter.dev/get-started/install) |
| Just        | 1.16.0         |[https://github.com/casey/just](https://github.com/casey/just)                 |

</details>

### Development

It's recommended to use VSCode for Flutter development. This will allow you to run, debug, test, etc. from within the IDE. You can also use Android Studio if you prefer.

### Just tasks

This project uses [Just](https://github.com/casey/just) as a command runner. You can see all available tasks by running `just --list`. The most common tasks are:
```bash
run           # Run the Flutter app
test          # Run tests
generate      # Generate code (localization, etc.)
get           # Get Flutter and Dart packages
```

These can be run with `just <task>`. For example, to run the app, you can run `just run`.
