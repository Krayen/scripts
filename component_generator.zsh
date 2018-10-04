#!/bin/zsh

# Script for creating a React Native component-directory with the name specified and two files inside named index.js and styles.js
# <ComponentName>
#    - index.js
#    - styles.js
# index.js contains boilerplate code for a basic React Native Class Component. The styles.js that is created is imported by default.
# styles.js contains boilerplate code for a basic React Native StyleSheet.

# Add a --help to describe what this script does.

# Read first input as name of Scene
echo Enter name and location for the component. Leave location empty to place in src/components.
echo Entering a location will place the component in src/scenes/LocationName
read "componentName?Component name: "
read "componentLocation?Component location: "

if [ -n "${componentLocation//[[:space:]]/}" ]
then
  echo $componentLocation
  cd src/scenes/$componentLocation
else
  cd src/components/
fi

mkdir $componentName

cd $componentName

touch index.js
cat <<EOF >index.js
import React from 'react'
import { Text, View } from 'react-native'
import styles from './styles.js'

class $componentName extends React.Component {
  render(){
    return(
      <View style={styles.container}>
        <Text style={styles.text}>$componentName</Text>
      </View>
    )
  }
}

export default $componentName
EOF

touch styles.js
cat <<EOF >styles.js
import { StyleSheet } from 'react-native'

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  text: {
    color: '#0e0e0e',
  }
})

export default styles
EOF

if [ -z "${componentLocation//[[:space:]]/}" ]
then
  cd ..
  cat <<EOF >>index.js
export { default as $componentName } from './$componentName'
EOF
fi

if [ -n "${componentLocation//[[:space:]]/}" ]
then
  echo Component $componentName created in src/components/$componentLocation
else
  echo Component $componentName created in src/components
fi
