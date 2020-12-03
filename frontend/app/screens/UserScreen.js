import React, { useState, useContext } from "react";
import {
  View,
  TouchableOpacity,
  Text,
  Image,
  StyleSheet,
  TextInput,
  Alert,
} from "react-native";
import { Avatar } from "react-native-elements";
import { FlatList } from "react-native-gesture-handler";
import { and } from "react-native-reanimated";
import Icon from "react-native-vector-icons/AntDesign";
import { setSignIn } from "../Routing/global/global";
export default function UserScreen({ navigation }) {
  const [name, setName] = useState("");
  const [new_email, set_new_email] = useState("");
  const { global_email, set_global_email } = useContext(setSignIn);

  return (
    <View style={styles.wrapper}>
      <View style={styles.header}>
        <TouchableOpacity
          onPress={() => {
            navigation.navigate("AccountScreen");
          }}
          style={{ paddingLeft: 18, paddingTop: 18 }}
        >
          <Icon name="arrowleft" style={{ fontSize: 30, color: "#B10D65" }} />
        </TouchableOpacity>
        <Text style={styles.headerTitle}>USER INFORMATION</Text>
      </View>
      <View style={styles.body}>
        <TextInput
          style={styles.textInput}
          placeholder="Enter your new email"
          autoCapitalize="none"
          value={new_email}
          onChangeText={(txtEmail) => set_new_email(txtEmail)}
        />

        <TextInput
          style={styles.textInput}
          placeholder="Enter your new name"
          autoCapitalize="none"
          value={name}
          onChangeText={(txtName) => setName(txtName)}
        />
        <TouchableOpacity
          style={styles.signInContainer}
          onPress={() => {
            if (new_email.length !== 0) {
              fetch("http://10.0.0.231/changeInfo", {
                method: "POST",
                headers: {
                  "Content-Type": "application/json",
                  Accept: "application/json",
                },
                body: JSON.stringify({
                  user_name: name,
                  new_email: new_email,
                  old_email: global_email,
                }),
              })
                .then((res) => res.json())
                .then((resJson) => {
                  // console.log(new_email);
                  set_global_email(new_email);
                  alert("your info has just updated");
                })
                .catch((err) => console.log(err));
            } else {
              alert("Insert into the form");
            }
          }}
        >
          <Text style={styles.signInTextStyle}>CHANGE YOUR INFOMATION</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
  },
  wrapper: { flex: 1, backgroundColor: "#fff" },
  header: {
    height: 75,
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    backgroundColor: "powderblue",
  }, // eslint-disable-line
  headerTitle: {
    color: "#B10D65",
    fontSize: 15,
    alignSelf: "center",
    paddingTop: 15,
    paddingRight: 110,
  },
  backIconStyle: { width: 30, height: 30 },
  body: { flex: 10, backgroundColor: "#F6F6F6", justifyContent: "center" },
  textInput: {
    height: 45,
    marginHorizontal: 20,
    backgroundColor: "#FFFFFF",
    paddingLeft: 20,
    borderRadius: 20,
    marginBottom: 20,
    borderColor: "#79b8ff",
    borderWidth: 1,
  },
  signInTextStyle: {
    color: "#B10D65",
    fontWeight: "600",
    paddingHorizontal: 20,
  },
  signInContainer: {
    marginHorizontal: 20,
    backgroundColor: "powderblue",
    borderRadius: 20,
    height: 45,
    alignItems: "center",
    justifyContent: "center",
    alignSelf: "stretch",
  },
  signInStyle: {
    flex: 3,
    marginTop: 50,
  },
});
