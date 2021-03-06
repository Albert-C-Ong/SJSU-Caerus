import React, { useEffect, useState, useContext } from "react";
import {
  View,
  Text,
  StyleSheet,
  Image,
  TouchableOpacity,
  FlatList,
} from "react-native";
import Icon from "react-native-vector-icons/AntDesign";
import { setSignIn } from "../Routing/global/global";
import { setLike } from "../Routing/global/like";

export default function MyGroupScreen({ navigation }) {
  // const { home_email } = route.params;
  const { global_email, set_global_email } = useContext(setSignIn);
  const [like, set_like] = useContext(setLike);
  // console.log(global_email);
  // const test = home_email;
  const [registered_clubs, set_registered_club] = useState();
  useEffect(() => {
    fetch("http://10.0.0.231/clubs/registered", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify({ user_email: global_email }),
    })
      .then((res) => res.json())
      .then((resJson) => {
        resJson.map((item) => {
          if (!(item.club_name in like)) {
            set_like({ ...like, [item.club_name]: "1" });
          }
        });
        // console.log(resJson);
        set_registered_club(resJson);
        // resJson
      })
      .catch((err) => console.log(err));
  });
  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <TouchableOpacity
          onPress={() => {
            navigation.goBack();
          }}
          style={{ paddingLeft: 18, paddingTop: 18 }}
        >
          <Icon name="arrowleft" style={{ fontSize: 30, color: "#B10D65" }} />
        </TouchableOpacity>
        <Text style={styles.headerTitle}>SJSU CAERUS</Text>
        <View style={{ width: 30 }} />
      </View>
      <View style={styles.body_flat}>
        <FlatList
          data={registered_clubs}
          renderItem={({ item }) => {
            return (
              <View style={styles.productContainer}>
                <Image
                  style={styles.productImage}
                  source={{
                    uri: item.club_avatar_img,
                  }}
                />
                <View style={styles.productInfo}>
                  <Text style={styles.txtName}>{item.club_name}</Text>
                  <Text
                    style={styles.txtPrice}
                    numberOfLines={2}
                    ellipsizeMode={"tail"}
                  >
                    {item.club_about}
                  </Text>

                  <TouchableOpacity
                    onPress={() => {
                      navigation.navigate("DetailScreen", {
                        e: item,
                      });
                    }}
                  >
                    <Text style={styles.txtShowDetail}>SHOW DETAILS</Text>
                  </TouchableOpacity>
                </View>
              </View>
            );
          }}
          keyExtractor={(item) => {
            return item.club_name.toString();
          }}
        />
      </View>
    </View>
  );
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#FFF",
  },
  productContainer: {
    flexDirection: "row",
    paddingVertical: 15,
    borderTopColor: "#F0F0F0",
    borderBottomColor: "#FFF",
    borderLeftColor: "#FFF",
    borderRightColor: "#FFF",
    borderWidth: 1,
  },
  productImage: { width: 90, height: 100, resizeMode: "contain" },
  txtName: {
    color: "#4630eb",
    fontSize: 20,
    fontWeight: "400",
    paddingLeft: 10,
  },
  txtPrice: { color: "black", paddingLeft: 10 },
  txtShowDetail: { color: "#B10D65", fontSize: 11, paddingLeft: 10 },
  header: {
    height: 75,
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    backgroundColor: "powderblue",
  }, // eslint-disable-line
  headerTitle: {
    color: "#B10D65",
    fontSize: 20,
    alignSelf: "center",
    paddingTop: 20,
  },
  body_flat: {
    paddingLeft: 10,
    paddingRight: 10,
  },
});
