import React from "react";
import Icon from "react-native-vector-icons/AntDesign";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import HomeScreen from "../screens/HomeScreen";
import MyGroupScreen from "../screens/MyGroupScreen";
import HometoDetails from "./HometoDetails";
import UsertoModify from "./UsertoModify";
const Tab = createBottomTabNavigator();
export default function Tabbar({ route }) {
  const { info, email } = route.params;
  //   console.log(info);
  return (
    <Tab.Navigator
      screenOptions={({ route }) => ({
        tabBarIcon: ({ tintColor }) => {
          let iconName;
          if (route.name === "Home") {
            iconName = "home";
          } else if (route.name === "Your Clubs") {
            iconName = "staro";
          } else if (route.name === "Account") {
            iconName = "user";
          }
          return <Icon name={iconName} size={30} color={tintColor} />;
        },
      })}
      tabBarOptions={{
        activeTintColor: "#B10D65",
        inactiveTintColor: "black",
        style: {
          backgroundColor: "powderblue",
        },
      }}
    >
      <Tab.Screen
        name="Home"
        component={HometoDetails}
        initialParams={{ info_send: info, home_email: email }}
      />
      <Tab.Screen name="Your Clubs" component={MyGroupScreen} />
      <Tab.Screen name="Account" component={UsertoModify} />
    </Tab.Navigator>
  );
}
