//
//  AnnotateViewStation.h
//  BikeShare
//
//  Created by Daniel Kwiatkowski on 2015-05-06.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//
#import "Station.h"
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AnnotateViewStation : NSObject <MKAnnotation>

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;



@end
