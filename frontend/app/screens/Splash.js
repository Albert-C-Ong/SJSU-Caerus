import React, { useEffect } from 'react'
import { View, Text,StyleSheet, Image } from 'react-native'
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
export default function Splash({ navigation }) {
    useEffect(() => {
        setTimeout(() => {
            navigation.navigate('Login')
        }, 3000);
    },[])
    return (
        <Image style={styles.logo} source={require('../assets/AppLogo.png')} />
    )
}
const styles = StyleSheet.create({
    logo: {
        flex:1,
        width: null,
        height: null,
        resizeMode: 'contain',
        backgroundColor: '#352da6',
        alignContent:'center'
      }

  });
