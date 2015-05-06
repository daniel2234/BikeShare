//
//  Station.m
//  BikeShare
//
//  Created by Daniel Kwiatkowski on 2015-05-06.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import "Station.h"

@implementation Station

//intializer for automatically grabbing coordinates
- (instancetype)init
{
    self = [super init];
    if (self) {
        _http = [[HTTPCommunication alloc]init];
    }
    return self;
}

//getting json data
-(void)getStations
{
     NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];
    [_http retrieveURL:url successBlock:^(NSData *response) {
        NSError *error= nil;
        //reads the dictionary values
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        if (!error) {
            NSArray *value = data[@"stationBeanList"];
            
            for (NSDictionary *dict in value) {
                NSLog(@"%@,",dict[@"id"]);
                NSLog(@"%@,",dict[@"stationName"]);
            }
        }
    }];
}


@end
