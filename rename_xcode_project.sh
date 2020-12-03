#!/bin/bash

function replaceInFiles {
sourceString=${1}
targetString=${2}
grep -rl "${sourceString}" --exclude-dir='.*/Carthage/Pods/fastlane/build' --exclude='.DS_Store' ./ | xargs -I{} sed -i \'\' "'s/$sourceString/$targetString/g'" {} 
}

function usage() {
    echo >&2 "Usage: $0 OLD_PROJECT_NAME NEW_PROJECT_NAME"
}

if [[ $# -lt 2 ]]; then
    usage
    exit 1
fi

OLD_PROJECT_NAME=$1
NEW_PROJECT_NAME=$2

cNone='\033[00m'
cRed='\033[00;31m'
cGreen='\033[00;32m'
cLightGreen='\033[01;32m'
cCyan='\033[00;36m'
cDarkGray='\033[00;90m'
cWhite='\033[00;97m'

function renameFilesAndDirectories {
  echo -e "${cLightGreen}Rename files and directories...${cNone}"
  SAVEIFS=$IFS
  IFS=$(echo -en "\n\b")
  for it in $(find . -depth ! -path "*/\.*" ! -path "*Pods*" ! -path "*Carthage*" ! -path "*fastlane*" ! -path "*build*" ! -path "*DS_Store*" -name "*${OLD_PROJECT_NAME}*")
  do
    beforeLastPath=${it%/*}
    lastPath=${it##*/}
    renamedLastPath=$(sed "s/$OLD_PROJECT_NAME/$NEW_PROJECT_NAME/g" <<< "$lastPath")
    newdir="$beforeLastPath/$renamedLastPath"
    echo -e "    $cDarkGray$beforeLastPath/$cNone$lastPath $cNone-> $cGreen$renamedLastPath$cNone"
    mv "$it" "$newdir"
  done
  IFS=$SAVEIFS
}

function replaceContentsOfFiles {
  echo -e "${cLightGreen}Replace contents of files...${cNone}"
  SAVEIFS=$IFS
  IFS=$(echo -en "\n\b")
  for it in $(grep -RIl --exclude-dir={*Pods*,*Carthage*,.*,*build*,*fastlane*,*.a} --exclude={*DS_Store*,*.xcuserstate,*.png,*.jpg,*.json,*.appiconset} ${OLD_PROJECT_NAME} *)
  do
    beforeLastPath=${it%/*}
    lastPath=${it##*/}
    if [[ "$beforeLastPath" == "$lastPath" ]]; then
      echo -e "    $lastPath"
    else
      echo -e "    $cDarkGray$beforeLastPath/$cNone$lastPath"
    fi
    sed -i '' "s/$OLD_PROJECT_NAME/$NEW_PROJECT_NAME/g" "${it}"
  done
  IFS=$SAVEIFS

}

renameFilesAndDirectories
replaceContentsOfFiles

exit 0
