import React from "react";
import {
  View,
  Text,
  FlatList,
  StyleSheet,
  TouchableOpacity,
  Image,
} from "react-native";
import Icon from "react-native-vector-icons/AntDesign";
export default function TypesGroup({ route, navigation }) {
  const { recommend } = route.params;
  let title_name = recommend[0].club_type;
  // console.log(title_name);
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
        <Text style={styles.headerTitle}>{title_name.toUpperCase()}</Text>
        <View style={{ width: 30 }} />
      </View>
      <View style={styles.body_flat}>
        <FlatList
          data={recommend}
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
                      navigation.navigate("DetailScreen", { e: item });
                    }}
                  >
                    <Text style={styles.txtShowDetail}>SHOW DETAILS</Text>
                  </TouchableOpacity>
                </View>
              </View>
            );
          }}
          keyExtractor={(item) => {
            return item.club_id.toString();
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
    color: "#ffbf00",
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
    fontSize: 15,
    alignSelf: "center",
    paddingTop: 20,
    paddingLeft: 5,
  },
  body_flat: {
    paddingLeft: 10,
    paddingRight: 10,
  },
});
