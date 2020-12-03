import React from "react";
import {
  View,
  Text,
  StyleSheet,
  Image,
  Dimensions,
  TouchableOpacity,
} from "react-native";
import Icon1 from "react-native-vector-icons/EvilIcons";
import Icon from "react-native-vector-icons/AntDesign";
import MapView, { Marker } from "react-native-maps";
export default function ContactUs({ route, navigation }) {
  const { e } = route.params;
  const {
    mapContainer,
    wrapper,
    infoContainer,
    rowInfoContainer,
    iconStyle,
    infoText,
  } = styles;
  return (
    <View style={wrapper}>
      <View style={styles.header}>
        <TouchableOpacity
          onPress={() => {
            navigation.goBack();
          }}
          style={{ paddingTop: 18 }}
        >
          <Icon name="arrowleft" style={{ fontSize: 30, color: "#B10D65" }} />
        </TouchableOpacity>
        <Text style={styles.headerTitle}>{e.club_name.toUpperCase()}</Text>
        <View style={{ width: 30 }} />
      </View>
      <View style={mapContainer}>
        <MapView
          style={{ width: width - 20, height: 275 }}
          initialRegion={{
            latitude: 37.3347,
            longitude: -121.8753,
            latitudeDelta: 0.0922,
            longitudeDelta: 0.0421,
          }}
        >
          <Marker
            coordinate={{ latitude: 37.3347, longitude: -121.8753 }}
            title="San Jose State University"
            description={e.club_name}
          />
        </MapView>
      </View>
      <View style={infoContainer}>
        <View style={rowInfoContainer}>
          <Icon1 name="location" style={iconStyle} />
          <Text style={infoText}>{e.club_location}</Text>
        </View>
        <View style={rowInfoContainer}>
          <Icon name="mail" style={iconStyle} />
          <Text style={infoText}>{e.club_email}</Text>
        </View>
      </View>
    </View>
  );
}
const { width } = Dimensions.get("window");
const styles = StyleSheet.create({
  header: {
    flexDirection: "row",
    justifyContent: "space-between",
    flex: 1,
    paddingHorizontal: 15,
    paddingTop: 20,
    backgroundColor: "powderblue",
  },
  wrapper: { flex: 5, backgroundColor: "#F6F6F6" },
  mapStyle: {
    width: width - 40,
    height: 230,
    alignSelf: "center",
    alignItems: "center",
    justifyContent: "center",
  },
  mapContainer: {
    justifyContent: "center",
    alignItems: "center",
    flex: 5,
    backgroundColor: "#FFFFFF",
    margin: 10,
    borderRadius: 2,
    shadowColor: "#3B5458",
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.2,
  },
  headerTitle: {
    color: "#AE005E",
    fontSize: 15,
    alignSelf: "center",
    paddingTop: 20,
    paddingLeft: 10,
  },
  infoContainer: {
    padding: 10,
    flex: 5,
    backgroundColor: "#FFF",
    margin: 10,
    marginTop: 0,
    borderRadius: 2,
    shadowColor: "#3B5458",
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.2,
  },
  rowInfoContainer: {
    flex: 5,
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    borderBottomWidth: 1,
    borderColor: "#D6D6D6",
  },
  imageStyle: {
    width: 30,
    height: 30,
  },
  infoText: {
    color: "#AE005E",
    fontWeight: "500",
  },
  iconStyle: {
    fontSize: 32,
    color: "#AE005E",
  },
});
