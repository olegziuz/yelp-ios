//
//  YLPDetailBusinessViewController.m
//  YelpAPI
//
//  Created by David Chen on 3/31/16.
//  Copyright © 2016 Yelp. All rights reserved.
//

#import "YLPDetailBusinessViewController.h"
#import <YelpAPI/YLPBusiness.h>
#import <YelpAPI/YLPLocation.h>

@interface YLPDetailBusinessViewController ()
@property (nonatomic) IBOutlet UILabel *businessName;
@property (nonatomic) IBOutlet UILabel *businessAddress;
@property (nonatomic) IBOutlet UILabel *businessPhone;
@property (nonatomic) IBOutlet UILabel *transactions;
@end

@implementation YLPDetailBusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.businessName.text = self.business.name;
    self.businessPhone.text = self.business.phone;
    self.businessAddress.text = self.business.location.address[0];
    self.transactions.text = [self.business.transactions componentsJoinedByString:@","];
    [self.transactions sizeToFit];
}

@end
