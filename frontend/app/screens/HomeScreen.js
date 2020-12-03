import React, { useEffect, useState, useContext } from "react";
import {
  View,
  Text,
  StyleSheet,
  Image,
  TouchableOpacity,
  ScrollView,
  Dimensions,
} from "react-native";
import { FlatList } from "react-native-gesture-handler";
import UserAvatar from "react-native-user-avatar";
import { setSignIn } from "../Routing/global/global";
import { setLike } from "../Routing/global/like";
export default function HomeScreen({ route, navigation }) {
  const { info_send_new, home_email_new } = route.params;
  // console.log(home_email_new);
  const [club_types, set_club_types] = useState();
  const [recommend_clubs, set_recommend_clubs] = useState([]);
  const { global_email, set_global_email } = useContext(setSignIn);
  const [like, set_like] = useContext(setLike);
  // console.log(like);
  useEffect(() => {
    set_global_email(home_email_new);
  }, []);
  useEffect(() => {
    fetch("http://10.0.0.231/types")
      .then((res) => res.json())
      .then((resJson) => {
        set_club_types(resJson);

        // console.log(global_email);
        // navigation.addListener("beforeRemove", (e) => {
        //   e.preventDefault();
        // });
      })
      .catch((err) => console.log(err));
  }, []);

  return (
    <View style={{ flex: 1, backgroundColor: "#FFF" }}>
      <View style={styles.header}>
        <View />
        <Text style={styles.headerTitle}>SJSU CAERUS</Text>
      </View>

      <View style={styles.container}>
        <FlatList
          data={club_types}
          ListHeaderComponent={
            <Text
              style={{
                paddingLeft: 10,
                color: "#B10D65",
                fontWeight: "400",
                fontSize: 20,
                borderBottomColor: "red",
                borderBottomWidth: 1,
              }}
            >
              CLUB TYPES
            </Text>
          }
          renderItem={({ item }) => {
            let avatar_name;
            let avatar_img;
            if (item.alltypes === "Club Sports") {
              avatar_name = "CS";
              avatar_img =
                "https://img.freepik.com/free-vector/modern-sport-logo-template-with-abstract-design_23-2147933494.jpg?size=338&ext=jpg";
            } else if (
              item.alltypes === "Cultural and Religious Organizations"
            ) {
              avatar_name = "CaRO";
              avatar_img =
                "https://content.thriveglobal.com/wp-content/uploads/2019/08/culture-word-.jpg";
            } else if (
              item.alltypes === "Academic and Honorary Organizations"
            ) {
              avatar_name = "AaHO";
              avatar_img =
                "https://www.psychology.org.au/getmedia/7e7e5fda-0877-4603-8c63-e0c4ea8ad223/19InPsych-October-p63-Analyse-this-Academic.jpg?width=300&height=350&ext=.jpg";
            } else if (item.alltypes === "Fraternities and Sororities") {
              avatar_name = "FaS";
              avatar_img =
                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Greek_lc_alpha.svg/1200px-Greek_lc_alpha.svg.png";
            } else {
              avatar_name = "SIO";
              avatar_img =
                "https://cdn.ymaws.com/swonlibraries.org/resource/resmgr/000/03groups/sigs-general-descrip/sigs-horizontal-min.png";
            }
            return (
              <TouchableOpacity
                style={styles.productContainer1}
                onPress={() => {
                  fetch("http://10.0.0.231/recommend", {
                    method: "POST",
                    headers: {
                      "Content-Type": "application/json",
                      Accept: "application/json",
                    },
                    body: JSON.stringify({ type: item.alltypes }),
                  })
                    .then((res) => res.json())
                    .then((resJson) => {
                      // console.log(resJson);
                      set_recommend_clubs(resJson);
                      navigation.navigate("TypesGroup", {
                        recommend: resJson,
                      });
                    })
                    .catch((err) => console.log(err));
                }}
              >
                <UserAvatar
                  size={55}
                  name={avatar_name}
                  src={avatar_img}
                  style={{ resizeMode: "contain" }}
                />
                <Text style={{ fontSize: 15, paddingTop: 11, paddingLeft: 10 }}>
                  {item.alltypes}
                </Text>
              </TouchableOpacity>
            );
          }}
          keyExtractor={(item) => {
            return item.type_id.toString();
          }}
          ListFooterComponent={
            <View>
              <View style={styles.imageContainer}>
                {recommend_clubs.length === 0 ? (
                  <View></View>
                ) : (
                  <View>
                    <Text
                      style={{
                        paddingLeft: 10,
                        color: "#B10D65",
                        fontWeight: "400",
                        fontSize: 20,
                        marginTop: 15,
                        borderBottomColor: "red",
                        borderBottomWidth: 1,
                      }}
                    >
                      Recommend for you
                    </Text>
                    <FlatList
                      style={{
                        flexDirection: "row",
                        padding: 10,
                        height: swiperHeight,
                      }}
                      horizontal
                      data={recommend_clubs}
                      renderItem={({ item }) => (
                        <TouchableOpacity
                          onPress={() =>
                            navigation.navigate("DetailScreen", {
                              e: item,
                              home_email: global_email,
                            })
                          }
                        >
                          <Image
                            source={{ uri: item.club_avatar_img }}
                            style={styles.productImageStyle}
                          />
                        </TouchableOpacity>
                      )}
                      keyExtractor={(item) => {
                        return item.club_id.toString();
                      }}
                    />
                  </View>
                )}
              </View>
              <Text
                style={{
                  paddingLeft: 10,
                  color: "#B10D65",
                  fontWeight: "400",
                  fontSize: 20,
                  marginTop: 15,
                  borderBottomColor: "red",
                  borderBottomWidth: 1,
                }}
              >
                SCHOOL CLUBS
              </Text>
              <FlatList
                data={info_send_new}
                renderItem={({ item }) => (
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
                          fetch("http://10.0.0.231/recommend", {
                            method: "POST",
                            headers: {
                              "Content-Type": "application/json",
                              Accept: "application/json",
                            },
                            body: JSON.stringify({ type: item.club_type }),
                          })
                            .then((res) => res.json())
                            .then((resJson) => {
                              // console.log(resJson);
                              set_recommend_clubs(resJson);
                              navigation.navigate("DetailScreen", {
                                e: item,
                                home_email: global_email,
                              });
                            })
                            .catch((err) => console.log(err));
                        }}
                      >
                        <Text style={styles.txtShowDetail}>SHOW DETAILS</Text>
                      </TouchableOpacity>
                    </View>
                  </View>
                )}
                keyExtractor={(item) => {
                  return item.club_id.toString();
                }}
              />
            </View>
          }
        />
      </View>
    </View>
  );
}
const { width } = Dimensions.get("window");
const swiperWidth = width / 1.8 - 30;
const swiperHeight = (swiperWidth * 452) / 361;
const styles = StyleSheet.create({
  container: {
    flex: 6,
    padding: 10,
  },
  productImageStyle: {
    width: swiperWidth,
    height: swiperHeight,
    marginHorizontal: 5,
    resizeMode: "contain",
  },
  productImage: { width: 90, height: 100, resizeMode: "contain" },
  productContainer: {
    flexDirection: "row",
    paddingVertical: 15,
    borderTopColor: "#F0F0F0",
    borderBottomColor: "#FFF",
    borderLeftColor: "#FFF",
    borderRightColor: "#FFF",
    borderWidth: 1,
  },
  imageContainer: {
    flex: 6,
    alignItems: "center",
    flexDirection: "row",
    marginHorizontal: 10,
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
  },
  titleStyle: { color: "#edf800", fontSize: 20 },
  lastRowInfo: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
  },
  txtName: {
    color: "#ffbf00",
    fontSize: 20,
    fontWeight: "400",
    paddingLeft: 10,
  },
  txtPrice: { color: "black", paddingLeft: 10 },
  txtShowDetail: { color: "#B10D65", fontSize: 11, paddingLeft: 10 },
  header: {
    flex: 0.5,
    backgroundColor: "powderblue",
    paddingTop: 10,
    flexDirection: "row",
    paddingHorizontal: 10,
    marginBottom: 10,
  }, // eslint-disable-line
  headerTitle: {
    color: "#B10D65",
    fontSize: 20,
    alignSelf: "center",
    paddingLeft: 120,

    paddingTop: 15,
  },
});
