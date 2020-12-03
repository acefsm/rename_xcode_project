# Super fast Xcode project renaming

It should be executed from inside root of Xcode project directory and called with two string parameters: 
rename_xcode_project.sh **$OLD_PROJECT_NAME** & **$NEW_PROJECT_NAME**

Script goes through all the files and directories recursively, including Xcode project or workspace file and replaces all occurrences of **$OLD_PROJECT_NAME** string with **$NEW_PROJECT_NAME** string (both in each file's name and content).

## Usage

```bash
# download script and make it executable
$ curl https://raw.githubusercontent.com/acefsm/rename_xcode_project/master/rename_xcode_project.sh -o rename_xcode_project.sh && chmod +x rename_xcode_project.sh

# run script
$ ./rename_xcode_project.sh "$OLD_PROJECT_NAME" "$NEW_PROJECT_NAME"

# remove script
$ rm rename_xcode_project.sh
```

## License
This code is released under the MIT license. See [LICENSE](LICENSE) for details.
