import React, { useState } from "react";
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  StyleSheet,
  Alert,
  Image,
} from "react-native";
import { useNavigation } from "@react-navigation/native";
export default function RegisterScreen(props) {
  const { inputStyle, bigButton, buttonText } = styles;
  const [user_email, set_user_email] = useState("");
  const [name, setName] = useState("");
  const [password, setPassword] = useState("");
  const [repassword, setRePassword] = useState("");
  const navigation = useNavigation();
  const registerUser = () => {
    fetch("http://10.0.0.231/register", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify({
        user_email: user_email,
        name: name,
        password: password,
      }),
    })
      .then((res) => {
        return res.json();
      })
      .then((resJson) => {
        if (resJson.status === "Good") {
          onSuccess();
        } else {
          onFail();
        }
      });
  };
  const onSuccess = () => {
    Alert.alert(
      "Notice",
      "Sign up successful",
      [{ text: "OK", onPress: () => navigation.navigate("Login") }],
      { cancelable: false }
    );
  };
  const onFail = () => {
    Alert.alert(
      "Notice",
      "Please Try Again, email has been used",
      [{ text: "OK", onPress: () => set_user_email("") }],
      { cancelable: false }
    );
  };
  return (
    <View style={{ backgroundColor: "#ffff", flex: 1 }}>
      <Image style={styles.logo} source={require("../assets/Applogo1.png")} />
      <TextInput
        style={inputStyle}
        placeholder="Enter your name"
        value={name}
        onChangeText={(text) => {
          setName(text);
        }}
      />
      <TextInput
        style={inputStyle}
        placeholder="Enter your email"
        value={user_email}
        onChangeText={(text) => {
          set_user_email(text);
        }}
      />
      <TextInput
        style={inputStyle}
        placeholder="Enter your password"
        value={password}
        secureTextEntry
        onChangeText={(text) => {
          setPassword(text);
        }}
      />
      <TextInput
        style={inputStyle}
        placeholder="Re-enter your password"
        value={repassword}
        secureTextEntry
        onChangeText={(text) => {
          setRePassword(text);
        }}
      />
      <TouchableOpacity style={bigButton} onPress={() => registerUser()}>
        <Text style={buttonText}>REGISTER NOW</Text>
      </TouchableOpacity>
    </View>
  );
}
const styles = StyleSheet.create({
  inputStyle: {
    height: 50,
    backgroundColor: "#ebedf0",
    marginBottom: 10,
    marginLeft: 10,
    marginRight: 10,
    borderRadius: 20,
    paddingLeft: 30,
  },
  bigButton: {
    height: 50,
    borderRadius: 20,
    marginTop: 10,
    borderWidth: 1,
    borderColor: "#FFF",
    alignItems: "center",
    justifyContent: "center",
    backgroundColor: "powderblue",
    marginLeft: 45,
    marginRight: 45,
  },
  buttonText: {
    color: "#B10D65",
    fontWeight: "400",
  },
  logo: {
    width: 500,
    height: 80,
    alignSelf: "center",
    resizeMode: "contain",
    marginTop: 50,
    marginBottom: 20,
  },
});
