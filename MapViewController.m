

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


- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view
calloutAccessoryControlTapped:(UIControl *)control
{
    UIViewController *moreInfoViewController = [[UIViewController alloc]
                                                  initWithNibName:@"MoreInfo" bundle:nil];
    moreInfoViewController.title = @"title";
    [self.navigationController pushViewController:moreInfoViewController animated:YES];
}
@end
