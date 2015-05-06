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
        [self getStations];
    }
    return self;
}

//getting json data
-(void)getStations
{
     NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];
    [_http retrieveURL:url successBlock:^(NSData *response) {
        NSError *error= nil;
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        NSLog(@"%@",data);
    }];
}


@end
