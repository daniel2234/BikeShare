//
//  ViewController.h
//  BikeShare
//
//  Created by Daniel Kwiatkowski on 2015-05-06.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    __weak UITextField *_streetField;
    __weak UITextField *_cityField;
    __weak UITextField *_countryField;
    __weak UIButton *_fetchCoordinatesButton;
    __weak UILabel *_nameLabel;
    __weak UILabel *_coordinatesLabel;
}

@property (nonatomic,weak) IBOutlet UITextField *streetField;
@property (nonatomic,weak) IBOutlet UITextField *cityField;
@property (nonatomic,weak) IBOutlet UITextField *countryField;
@property (nonatomic,weak) IBOutlet UIButton *fetchCoordinatesButton;
@property (nonatomic,weak) IBOutlet UILabel *nameLabel;
@property (nonatomic,weak) IBOutlet UILabel *coordinatesLabel;



-(IBAction)fetchCoordinates:(id)sender;




@end
