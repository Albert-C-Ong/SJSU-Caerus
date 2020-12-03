import React from "react";
import { createStackNavigator } from "@react-navigation/stack";
import HomeScreen from "../screens/HomeScreen";
import DetailScreen from "../screens/DetailScreen";
import TypesGroup from "../screens/TypesGroup";
import Contactus from "../screens/Contactus";
const Stack = createStackNavigator();
export default function HometoDetails({ route }) {
  const { info_send, home_email } = route.params;
  return (
    <Stack.Navigator initialRouteName="HomeScreen">
      <Stack.Screen
        name="HomeScreen"
        component={HomeScreen}
        options={{ headerShown: false }}
        initialParams={{ info_send_new: info_send, home_email_new: home_email }}
      />
      <Stack.Screen
        name="DetailScreen"
        component={DetailScreen}
        options={{ headerShown: false }}
      />
      <Stack.Screen
        name="TypesGroup"
        component={TypesGroup}
        options={{ headerShown: false }}
      />
      <Stack.Screen
        name="ContactUs"
        component={Contactus}
        options={{ headerShown: false }}
      />
    </Stack.Navigator>
  );
}
