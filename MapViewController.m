

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapViewController.h"
#import "AnnotateViewStation.h"



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
    
    self.station = [[Station alloc]init];
    
    //set a standard map
    CLLocation *location = [self.locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    
    MKCoordinateSpan span = {.latitudeDelta = 0.09, .longitudeDelta = 0.09};
    MKCoordinateRegion region = {coordinate, span};
    
    [self.mapView setRegion:(region) animated:YES];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.station getStationsOnSuccess:^(NSArray *stationList) {
        for (AnnotateViewStation *annotation in stationList) {
            [self.mapView addAnnotation:annotation];
            
        }
    }];
}


- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // Try to dequeue an existing pin view first (code not shown).
    
    // If no pin view already exists, create a new one.
    MKPinAnnotationView *view = [[MKPinAnnotationView alloc]
                                          initWithAnnotation:annotation reuseIdentifier:@"annoView"];
    view.pinColor = MKPinAnnotationColorPurple;
    view.canShowCallout = YES;
    view.image = [UIImage imageNamed:@"bike_share_toronto_logo.png"];
    
    // Because this is an iOS app, add the detail disclosure button to display details about the annotation in another view.
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    view.rightCalloutAccessoryView = rightButton;
    
    // Add a custom image to the left side of the callout.
    UIImageView *myCustomImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bike_share_toronto_logo.png"]];
    view.leftCalloutAccessoryView = myCustomImage;
    
    return view;
}


- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self.tabBarController setSelectedIndex:2];
}

@end
