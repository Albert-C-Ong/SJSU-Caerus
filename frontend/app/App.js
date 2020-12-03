import { StatusBar } from "expo-status-bar";
import React, { useCallback, useState } from "react";
import { StyleSheet, Text, View } from "react-native";
import { NavigationContainer, useFocusEffect } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";
import LoginScreen from "../frontpage/screens/LoginScreen";
import RegisterScreen from "../frontpage/screens/RegisterScreen";
import Tabbar from "./Routing/Tabbar";
import Splash from "../frontpage/screens/Splash";
import { setSignIn } from "./Routing/global/global";
import { setLike } from "./Routing/global/like";
const Stack = createStackNavigator();
export default function App() {
  const [global_email, set_global_email] = useState(null);
  const [like, set_like] = useState({});
  return (
    <setSignIn.Provider value={{ global_email, set_global_email }}>
      <setLike.Provider value={[like, set_like]}>
        <NavigationContainer>
          <Stack.Navigator initialRouteName="Splash">
            <Stack.Screen
              name="Splash"
              component={Splash}
              options={{ headerShown: false }}
            />
            <Stack.Screen
              name="Login"
              component={LoginScreen}
              options={{ headerShown: false }}
            />
            <Stack.Screen
              name="Register"
              component={RegisterScreen}
              options={{ title: null }}
            />
            <Stack.Screen
              name="Tab"
              component={Tabbar}
              options={{ headerShown: false }}
            />
          </Stack.Navigator>
        </NavigationContainer>
      </setLike.Provider>
    </setSignIn.Provider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
