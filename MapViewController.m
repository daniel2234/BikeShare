

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
//    [station getStations];
   
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

//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
//{
//    MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"annoView"];
//    if(!view) {
//        view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annoView"];
//        view.image = [UIImage imageNamed:@"bike_share_toronto_logo.png"];
//        
//    }
//    return view;
//}



- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // Try to dequeue an existing pin view first (code not shown).
    
    // If no pin view already exists, create a new one.
    MKPinAnnotationView *customPinView = [[MKPinAnnotationView alloc]
                                          initWithAnnotation:annotation reuseIdentifier:@"annoView"];
    customPinView.pinColor = MKPinAnnotationColorPurple;
    customPinView.canShowCallout = YES;
    customPinView.image = [UIImage imageNamed:@"bike_share_toronto_logo.png"];
    
    // Because this is an iOS app, add the detail disclosure button to display details about the annotation in another view.
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    customPinView.rightCalloutAccessoryView = rightButton;
    
    // Add a custom image to the left side of the callout.
    UIImageView *myCustomImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bike_share_toronto_logo.png"]];
    customPinView.leftCalloutAccessoryView = myCustomImage;
    
    return customPinView;
}

@end
