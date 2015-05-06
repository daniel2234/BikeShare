

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapViewController.h"



@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_mapView];
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc]init];
    
    if (IS_OS_8_OR_LATER) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }

    [self.locationManager startUpdatingLocation];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = NO;
    
    Station *station = [[Station alloc]init];
    [station getStations];
    
    
    // set longitude and longitude
//    double lat = 43.642566;
//    double lng = -79.387057;
//    //A structure that contains a geographical coordinate using the WGS 84 reference frame.
//    
//    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat,lng);
//    
//    //     A MKPlacemark object stores placemark data for a given latitude and longitude. Placemark data includes information such as the country, state, city, and //street address associated with the specified coordinate. You can initialize a placemark using the initWithPlacemark: inherited method or the //initWithCoordinate:addressDictionary: method specifying a coordinate and address dictionary.
//    
//    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coord
//                                                   addressDictionary:nil];
//    //A MKPlacemark object stores placemark data for a given latitude and longitude. Placemark data includes information such as the country, state, city, and //street address associated with the specified coordinate. You can initialize a placemark using the initWithPlacemark: inherited method or the //initWithCoordinate:addressDictionary: method specifying a coordinate and address dictionary.
//    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
//    // display the map
//    [mapItem openInMapsWithLaunchOptions:nil];
}


@end
