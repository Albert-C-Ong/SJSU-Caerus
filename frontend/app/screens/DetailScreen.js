import React, { useEffect, useState, useContext } from "react";
import {
  View,
  Text,
  StyleSheet,
  Image,
  Dimensions,
  FlatList,
  ScrollView,
  TouchableOpacity,
  Linking,
} from "react-native";
import AsyncStorage from "@react-native-async-storage/async-storage";
import Icon from "react-native-vector-icons/AntDesign";
import { setSignIn } from "../Routing/global/global";
import { setLike } from "../Routing/global/like";
export default function DetailScreen({ route, navigation }) {
  const {
    wrapper,
    cardStyle,
    header,
    footer,
    backStyle,
    imageContainer,
    cartStyle,
    textBlack,
    textSmoke,
    textHighlight,
    textMain,
    titleContainer,
    descContainer,
    productImageStyle,
    descStyle,
    txtMaterial,
    txtColor,
  } = styles;
  // useEffect()
  const { e } = route.params;
  const [info_club_activities, set_info_club_activities] = useState([]);
  const [register, set_register] = useState();
  const { global_email, set_global_email } = useContext(setSignIn);
  const [like, set_like] = useContext(setLike);
  // console.log(like);
  useEffect(() => {
    fetch(`http://10.0.0.231/clubs/activities/${e.club_name}`)
      .then((res) => res.json())
      .then((resJson) => {
        set_info_club_activities(resJson);
        if (e.club_name in like && like[e.club_name] === "1") {
          set_register("like1");
        } else {
          set_register("like2");
        }
      })
      .catch((err) => console.log(err));
  }, []);
  return (
    <View style={wrapper}>
      <View style={header}>
        <TouchableOpacity onPress={() => navigation.goBack()}>
          <Icon name="arrowleft" style={backStyle} />
        </TouchableOpacity>
        <TouchableOpacity
          onPress={() => {
            if (register === "like2") {
              fetch("http://10.0.0.231/clubs/registerednewclub", {
                method: "POST",
                headers: {
                  "Content-Type": "application/json",
                  Accept: "application/json",
                },
                body: JSON.stringify({
                  user_email: global_email,
                  club_name: e.club_name,
                }),
              })
                .then((res) => res.json())
                .then((resJson) => {
                  if (resJson.length !== 0) {
                    set_register("like1");
                    set_like({ ...like, [e.club_name]: "1" });
                  }
                })
                .catch((err) => console.log(err));
            } else {
              fetch("http://10.0.0.231/clubs/unregistered", {
                method: "POST",
                headers: {
                  "Content-Type": "application/json",
                  Accept: "application/json",
                },
                body: JSON.stringify({
                  user_email: global_email,
                  club_name: e.club_name,
                }),
              })
                .then((res) => res.json())
                .then((resJson) => {
                  if (resJson.length === 0) {
                    set_register("like2");
                    set_like({ ...like, [e.club_name]: "0" });
                  }
                })
                .catch((err) => console.log(err));
            }
          }}
        >
          <Icon name={register} style={cartStyle} />
        </TouchableOpacity>
      </View>
      <View style={imageContainer}>
        <Image
          source={{
            uri: e.club_background_img,
          }}
          style={productImageStyle}
        />
      </View>
      <View style={footer}>
        <View style={titleContainer}>
          <Text style={textMain}>
            <Text style={textBlack}>{e.club_name.toUpperCase()}</Text>
          </Text>
        </View>
        <ScrollView style={descContainer}>
          <Text style={styles.textaboutus}>About Us</Text>
          <Text style={descStyle}>{e.club_about}</Text>
          <TouchableOpacity
            onPress={() => navigation.navigate("ContactUs", { e: e })}
          >
            <Text style={styles.contactusstyle}>Contact us</Text>
          </TouchableOpacity>

          <View style={descContainer}>
            <Text style={styles.textEvent}>Events</Text>
            {info_club_activities.length === 0 ? (
              <Text style={styles.productContainer1}>
                There is no activities availables
              </Text>
            ) : (
              info_club_activities.map((item) => (
                <View key={item.club_activities_id}>
                  <TouchableOpacity
                    onPress={() => Linking.openURL(`https://${item.club_link}`)}
                    style={styles.productContainer1}
                  >
                    <Text style={{ color: "#C21C70", fontSize: 17 }}>
                      {item.club_activities}
                    </Text>
                    <Text style={{ fontSize: 12 }}>
                      {item.club_date.toString().slice(0, 16)}
                    </Text>
                  </TouchableOpacity>
                </View>
              ))
            )}
          </View>
        </ScrollView>
      </View>
    </View>
  );
}
const { width } = Dimensions.get("window");
const swiperWidth = width / 1.8 - 30;
const swiperHeight = (swiperWidth * 452) / 361;
const styles = StyleSheet.create({
  contactusstyle: {
    color: "#B10D65",
    fontSize: 11,
    paddingLeft: 20,
    paddingTop: 5,
    textTransform: "uppercase",
  },
  wrapper: {
    flex: 1,
    backgroundColor: "#FFFF",
  },
  cardStyle: {
    flex: 1,
    backgroundColor: "#FFFFFF",
    borderRadius: 5,
    marginHorizontal: 10,
    marginVertical: 10,
  },
  header: {
    flexDirection: "row",
    justifyContent: "space-between",
    flex: 1,
    paddingHorizontal: 15,
    paddingTop: 20,
    backgroundColor: "powderblue",
  },
  cartStyle: {
    fontSize: 35,
    color: "#C21C70",
    paddingTop: 10,
  },
  backStyle: {
    color: "#C21C70",
    paddingTop: 10,
    fontSize: 35,
  },
  productStyle: {
    width: width / 2,
    height: width / 2,
  },
  footer: {
    flex: 6,
    marginTop: -20,
  },
  imageContainer: {
    flex: 6,
    alignItems: "center",
    flexDirection: "row",
    marginHorizontal: 10,
    marginLeft: 20,
  },
  textMain: {
    paddingLeft: 20,
    marginVertical: 10,
  },
  textEvent: {
    fontSize: 20,
    fontWeight: "bold",
    color: "#4630eb",
    marginTop: -10,
    paddingBottom: 2,
  },
  textaboutus: {
    fontSize: 20,
    fontWeight: "bold",
    color: "#4630eb",
    paddingBottom: 2,
    marginLeft: 20,
    borderBottomColor: "#F6F6F6",
    borderBottomWidth: 1,
  },
  textBlack: {
    fontSize: 20,
    fontWeight: "bold",
    color: "#ffbf00",
  },
  textSmoke: {
    fontSize: 20,
    color: "#9A9A9A",
  },
  textHighlight: {
    fontSize: 20,
    color: "#7D59C8",
  },
  titleContainer: {
    borderBottomWidth: 1,
    borderColor: "#F6F6F6",
    marginHorizontal: 20,
  },
  descContainer: {
    margin: 10,
    paddingTop: 10,
    paddingHorizontal: 10,
  },
  descStyle: {
    color: "black",
    textAlign: "justify",
    fontSize: 15,
    paddingLeft: 20,
  },
  productContainer: {
    flexDirection: "row",
    paddingVertical: 15,
    borderTopColor: "#F0F0F0",
    borderBottomColor: "#FFF",
    borderLeftColor: "#FFF",
    borderRightColor: "#FFF",
    borderWidth: 1,
    paddingLeft: 15,
  },
  productContainer1: {
    flexDirection: "column",
    paddingVertical: 15,
    borderTopColor: "#F0F0F0",
    borderBottomColor: "#FFF",
    borderLeftColor: "#FFF",
    borderRightColor: "#FFF",
    borderWidth: 1,
  },
  linkStyle: {
    color: "#7D59C8",
  },
  productImageStyle: {
    paddingTop: 10,
    width: 350,
    height: 300,
    resizeMode: "contain",
  },
  mainRight: {
    justifyContent: "space-between",
    alignSelf: "stretch",
    paddingLeft: 20,
  },
  txtColor: {
    color: "#C21C70",
    fontSize: 15,
    fontWeight: "400",
  },
  txtMaterial: {
    color: "#C21C70",
    fontSize: 15,
    fontWeight: "400",
  },
});
