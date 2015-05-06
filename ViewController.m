//
//  ViewController.m
//  BikeShare
//
//  Created by Daniel Kwiatkowski on 2015-05-06.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize streetField = _streetField, cityField = _cityField, countryField = _countryField, fetchCoordinatesButton = _fetchCoordinatesButton, nameLabel = _nameLabel, coordinatesLabel = _coordinatesLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)fetchCoordinates:(id)sender{
    NSLog(@"coordinates fetched");
}


@end
