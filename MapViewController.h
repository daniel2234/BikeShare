


#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "HTTPCommunication.h"
#import "Station.h"


@interface MapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>

@property(nonatomic,strong) MKMapView *mapView;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic, strong) Station *station;

@end
