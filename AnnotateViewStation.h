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

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
