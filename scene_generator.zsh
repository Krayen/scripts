#!/bin/zsh

# Script for creating a React Native scene-directory with the name specified and two files inside named index.js and styles.js
# <SceneName>
#    - index.js
#    - styles.js
# index.js contains boilerplate code for a basic React Native Class Scene. The styles.js that is created is imported by default.
# styles.js contains boilerplate code for a basic React Native StyleSheet.

# Add a --help to describe what this script does.

# Read first input as name of Scene
echo Enter name for Scene, it will be created in /src/scenes
read "sceneName?Scene name: "
# read "sceneLocation?Scene location: "

# if [ -n $sceneLocation ]
# then
# cd src/scenes/$sceneLocation
# else
#   cd src/scenes/
# fi
cd src/scenes

mkdir $sceneName

cd $sceneName

# Instead of creating new files, copy existing templates into the newly created directory.
# The problem with this is not being able to write the name of the Component directly.

touch index.js
cat <<EOF >index.js
import React from 'react'
import { Text, View } from 'react-native'
import styles from './styles.js'

class $sceneName extends React.Component {
  render(){
    return(
      <View style={styles.container}>
        <Text style={styles.text}>$sceneName</Text>
      </View>
    )
  }
}

export default $sceneName
EOF

touch styles.js
cat <<EOF >styles.js
import { StyleSheet } from 'react-native'

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
  },
  text: {
    color: '#0e0e0e',
  }
})

export default styles
EOF

echo Scene $sceneName created in src/scenes/
