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
-(void)getStationsOnSuccess:(void (^)(NSArray *stationList))success
{
     NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];
    [_http retrieveURL:url successBlock:^(NSData *response) {
        NSError *error= nil;
        //reads the dictionary values
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        NSArray *stationsResults = [data objectForKey:@"stationBeanList"];
        NSMutableArray *stationList = [[NSMutableArray alloc]init];
        
        for (NSDictionary *dict in stationsResults) {
            NSNumber *longitude = dict[@"longitude"];
            NSNumber *latitude = dict[@"latitude"];
            
            CLLocationCoordinate2D anonCoords = CLLocationCoordinate2DMake([latitude doubleValue],[longitude doubleValue]);
            //allocate an annotation object
            AnnotateViewStation *annotation = [[AnnotateViewStation alloc]init];
            //pass the value of the annotation
            annotation.coordinate = anonCoords;
            [stationList addObject:annotation];
        }
        if (success)
        {
           success(stationList);
        }
    }];
}


@end
