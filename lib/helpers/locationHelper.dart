const TOM_TOM_API_KEY = '6u3qsg3cwqYhlrRLOpAfxyqFPAoTbL1A';

class LocationHelper {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    // return 'https://api.tomtom.com/map/1/tile/basic/main/0/0/0.png?view=Unified&key=$TOM_TOM_API_KEY';

    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:C%$latitude,$longitude&key=$TOM_TOM_API_KEY';
  }
}
