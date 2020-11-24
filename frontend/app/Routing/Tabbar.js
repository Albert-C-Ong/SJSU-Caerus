import React from 'react'
import { View, Text, StyleSheet } from 'react-native'
import { NavigationContainer } from '@react-navigation/native';
import Icon from "react-native-vector-icons/AntDesign";
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import HomeScreen from "../screens/HomeScreen";
import MyGroupScreen from "../screens/MyGroupScreen"
import User from "../screens/UserScreen"
const Tab = createBottomTabNavigator();
export default function Tabbar({post}) {
    return (
        <Tab.Navigator screenOptions={({ route }) => ({
            tabBarIcon: ({ tintColor }) => {
                let iconName;
                if (route.name === "Home") {
                    iconName = "home";
                } else if (route.name === "Your Clubs") {
                    iconName = "staro";
                } else if (route.name === "User") {
                    iconName = "user";
                }
                return <Icon name={iconName} size={25} color={tintColor} />;
                },
        })}
            tabBarOptions={{
                activeTintColor: "white",
                inactiveTintColor: "black",
                style: {
                  backgroundColor: "powderblue",
                },
              }}>
            <Tab.Screen name="Home" component={HomeScreen} />
            <Tab.Screen name="Your Clubs" component={MyGroupScreen} />
            <Tab.Screen name = "User" component={User}/>
            </Tab.Navigator>
    )
}

