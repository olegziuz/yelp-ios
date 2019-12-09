//
//  YLPSearchTableViewController.m
//  YelpAPI
//
//  Created by David Chen on 3/31/16.
//  Copyright © 2016 Yelp. All rights reserved.
//

#import "YLPSearchTableViewController.h"
#import "YLPDetailBusinessViewController.h"
#import "YLPAppDelegate.h"
#import <YelpAPI/YLPClient+Search.h>
#import <YelpAPI/YLPSortType.h>
#import <YelpAPI/YLPSearch.h>
#import <YelpAPI/YLPBusiness.h>
#import "YLPClient+Reservation.h"

#define LOCATION @"San Francisco, CA"
#define TERM @"restaurants"
#define LIMIT 10
#define RESERVATION_TIME @"19:00"
#define RESERVATION_DATE @"2019-12-10"
#define RESERVATION_COVERS 2

@interface YLPSearchTableViewController ()
@property (nonatomic) YLPSearch *search;
@end

@implementation YLPSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	//    [[YLPAppDelegate sharedClient] searchWithLocation:LOCATION term:TERM limit:LIMIT offset:0 sort:YLPSortTypeBestMatched completionHandler:^
	
	[[YLPAppDelegate sharedClient] searchWithLocation:LOCATION term:TERM limit:LIMIT offset:0 sort:YLPSortTypeBestMatched reservationTime:RESERVATION_TIME reservationDate:RESERVATION_DATE reservationCovers:RESERVATION_COVERS completionHandler:^
        (YLPSearch *search, NSError* error) {
            self.search = search;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return LIMIT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell" forIndexPath:indexPath];
    if (indexPath.item > [self.search.businesses count]) {
        cell.textLabel.text = @"";
    }
    else {
        cell.textLabel.text = self.search.businesses[indexPath.item].name;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    YLPDetailBusinessViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"YLPDetailBusinessViewController"];
    vc.business = self.search.businesses[indexPath.item];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
