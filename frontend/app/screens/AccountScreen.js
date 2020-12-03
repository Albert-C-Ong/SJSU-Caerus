import React, { useState, useEffect, useContext } from "react";
import { StyleSheet, View, FlatList, Text } from "react-native";

import Screen from "../components/Screen";
import { ListItem, ListItemSeparator } from "../components/lists";
import colors from "../config/colors";
import Icon from "../components/Icon";
import { TouchableOpacity } from "react-native-gesture-handler";
import { NavigationContainer } from "@react-navigation/native";
import UserAvatar from "react-native-user-avatar";
import { setSignIn } from "../Routing/global/global";

const menuItems = [
  {
    title: "Change Info",
    icon: {
      name: "format-list-bulleted",
      backgroundColor: colors.primary,
    },
  },
];

function AccountScreen({ navigation }) {
  const { global_email, set_global_email } = useContext(setSignIn);
  // set_global_email(...global_email, "test");
  // console.log(global_email);
  const [user_name, set_user_name] = useState();
  useEffect(() => {
    fetch("http://10.0.0.231/studentInfo", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify({ user_email: global_email }),
    })
      .then((res) => res.json())
      .then((resJson) => {
        // set_global_email(global_email.concat("test"));
        // console.log(global_email);
        // console.log(resJson);
        set_user_name(resJson[0].user_name);
      })
      .catch((err) => console.log(err));
  });
  return (
    <Screen style={styles.screen}>
      <View style={styles.container}>
        <FlatList
          ListHeaderComponent={
            <View style={styles.productContainer1}>
              <UserAvatar
                size={55}
                name={user_name}
                style={{ resizeMode: "contain" }}
              />
              <View style={{ flexDirection: "column" }}>
                <Text style={{ fontSize: 20 }}>{user_name}</Text>
                <Text
                  style={{
                    fontSize: 15,
                    color: "#AFAEAF",
                    paddingLeft: -15,
                  }}
                >
                  {global_email}
                </Text>
              </View>
            </View>
          }
          data={menuItems}
          keyExtractor={(menuItem) => menuItem.title}
          ItemSeparatorComponent={ListItemSeparator}
          renderItem={({ item }) => (
            <TouchableOpacity
              onPress={() => {
                item.title === "Change Info"
                  ? navigation.navigate("UserScreen")
                  : console.log("hello");
              }}
            >
              <ListItem
                title={item.title}
                IconComponent={
                  <Icon
                    name={item.icon.name}
                    backgroundColor={item.icon.backgroundColor}
                  />
                }
              />
            </TouchableOpacity>
          )}
        />

        <TouchableOpacity
          onPress={() => {
            navigation.navigate("Login");
          }}
        >
          <ListItem
            title="Log Out"
            IconComponent={<Icon name="logout" backgroundColor="#ffe66d" />}
          />
        </TouchableOpacity>
      </View>
    </Screen>
  );
}

const styles = StyleSheet.create({
  screen: {
    backgroundColor: "#FFF",
  },
  headerTitle: {
    color: "#B10D65",
    fontSize: 15,
    alignSelf: "center",
    paddingTop: 20,
    paddingLeft: 5,
  },
  container: {
    marginVertical: 20,
  },
  header: {
    height: 75,
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    backgroundColor: "powderblue",
  },
  productContainer1: {
    flex: 6,
    marginTop: 15,
    flexDirection: "row",
    paddingHorizontal: 15,
    borderTopColor: "#F0F0F0",
    borderBottomColor: "#FFF",
    borderLeftColor: "#FFF",
    borderRightColor: "#FFF",
    borderWidth: 1,
    marginBottom: 10,
  },
});

export default AccountScreen;
