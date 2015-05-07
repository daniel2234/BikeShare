//
//  Station.h
//  BikeShare
//
//  Created by Daniel Kwiatkowski on 2015-05-06.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "HTTPCommunication.h"
#import "AnnotateViewStation.h"

@interface Station : NSObject

@property (nonatomic,strong) HTTPCommunication *http;

-(void)getStationsOnSuccess:(void (^)(NSArray *stationList))success;//array wiill called once the network request finishes

@end
