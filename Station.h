//
//  Station.h
//  BikeShare
//
//  Created by Daniel Kwiatkowski on 2015-05-06.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPCommunication.h"

@interface Station : NSObject

@property (nonatomic,strong) HTTPCommunication *http;



-(void)getStations;

@end
