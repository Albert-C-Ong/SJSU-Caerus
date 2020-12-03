import React, { useContext } from "react";
import { View, Text } from "react-native";
import { createStackNavigator } from "@react-navigation/stack";
import AccountScreen from "../screens/AccountScreen";
import UserScreen from "../screens/UserScreen";
import { setSignIn } from "./global/global";
const Stack = createStackNavigator();
export default function UsertoModify() {
  const { global_email, set_global_email } = useContext(setSignIn);
  return (
    <Stack.Navigator initialRouteName="AccountScreen">
      <Stack.Screen
        name="AccountScreen"
        component={AccountScreen}
        options={{ headerShown: false }}
      />
      <Stack.Screen
        name="UserScreen"
        component={UserScreen}
        options={{ headerShown: false }}
      />
    </Stack.Navigator>
  );
}
