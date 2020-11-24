import React, { useEffect,useState } from "react";
import { StyleSheet, Image, Text,View,TextInput,Alert } from "react-native";
import { TouchableOpacity } from "react-native-gesture-handler";
import { useNavigation } from '@react-navigation/native';


function LoginScreen(props) {
  const [user_email, set_user_Email] = useState("");
  const [password, setPassword] = useState("");
  const { inputStyle, bigButton, buttonText } = styles;
  const navigation = useNavigation();

  const onSignIn = () => {
    fetch("http://10.0.0.231/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify({ user_email: user_email, password: password }),
    })
      .then((res) => {
        return res.json();
      })
      .then((resJson) => {
        if (resJson[0].status === "Login successful") {
          navigation.navigate("Tab");
        } else {
          alert('Check your email and password again');
        }
      })
      .catch((err) => err);
  };
  return (
    <View style = {{backgroundColor:"#ffff", flex:1}} >
      <Image style={styles.logo} source={require('../assets/Applogo1.png')} />
      <Text style={styles.titleStyle}>Email</Text>
      <TextInput
        style={inputStyle}
        placeholder="Enter your email"
        value={user_email}
        onChangeText={(text) => set_user_Email(text)}
      />
      <Text style={styles.titleStyle}>Password</Text>
      <TextInput
        style={inputStyle}
        placeholder="Enter your password"
        value={password}
        onChangeText={(text) => setPassword(text)}
        secureTextEntry
      />
      <TouchableOpacity
        style={bigButton}
        onPress={() => {
          onSignIn();
        }}
      >
        <Text style={buttonText}>SIGN IN</Text>
      </TouchableOpacity>
      <TouchableOpacity style={{alignItems:"center"}} onPress={()=>{navigation.navigate('Register')}}>
        <Text>Not having an account?</Text>
      </TouchableOpacity>
    </View>)
}

const styles = StyleSheet.create({
  inputStyle: {
    height: 50,
    backgroundColor: "#ebedf0",
    marginBottom: 10,
    marginLeft: 10,
    marginRight:10,
    borderRadius: 20,
    paddingLeft: 30,
  },
  bigButton: {
    height: 50,
    borderRadius: 20,
    marginTop:10,
    borderWidth: 1,
    borderColor: "#FFF",
    alignItems: "center",
    justifyContent: "center",
    backgroundColor: "powderblue",
    marginLeft: 45,
    marginRight:45
  },
  buttonText: {
    color: "#edf800",
    fontWeight: "400",
  },
  logo: {
    width: 500,
    height: 80,
    alignSelf: "center",
    resizeMode:"contain",
    marginTop: 50,
    marginBottom: 20,
  },
  titleStyle: {
    fontSize: 25,
    paddingLeft: 20,
    color:"#edf800"
  }
});

export default LoginScreen;
