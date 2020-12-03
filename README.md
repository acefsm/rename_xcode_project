
# Super fast Xcode project renaming

![Alt Text](https://i.imgur.com/3q6Kp6N.gif)

It should be executed from inside root of Xcode project directory and called with two string parameters: 
rename_xcode_project.sh **$OLD_PROJECT_NAME** & **$NEW_PROJECT_NAME**

Script goes through all the files and directories recursively, including Xcode project or workspace file and replaces all occurrences of **$OLD_PROJECT_NAME** string with **$NEW_PROJECT_NAME** string (both in each file's name and content).

## Usage

```sh
# download script and make it executable
$ curl https://raw.githubusercontent.com/acefsm/rename_xcode_project/main/rename_xcode_project.sh -o rename_xcode_project.sh && chmod +x rename_xcode_project.sh

# run script
$ ./rename_xcode_project.sh "$OLD_PROJECT_NAME" "$NEW_PROJECT_NAME"

# remove script
$ rm rename_xcode_project.sh
```

## Performance
More than 150x (1️⃣5️⃣0️⃣) times faster than [swift version](https://github.com/appculture/xcode-project-renamer)
| Project | Bash time | Swift time|
| ------ | ------ | ------ |
| Kickstarter | 1.2 seconds  | 197 seconds |
| RxSwift | 3 seconds  | 17 seconds |

```sh
# Bash version
./rename_xcode_project.sh Kickstarter Kukumber  0.59s user 0.56s system 94% cpu 1.211 total
./rename_xcode_project.sh Rx RXXX  1.04s user 1.79s system 92% cpu 3.065 total

# Swift version
./rename.swift Kickstarter Kukumber  195.24s user 1.32s system 99% cpu 3:17.15 total
./rename.swift Rx RXXX  16.68s user 0.57s system 98% cpu 17.445 total

```

## License
This code is released under the MIT license. See [LICENSE](LICENSE) for details.

