//
//  YLPClient+Reservation.m
//  YelpAPI
//
//  Created by Oleg Zjuz on 08.12.2019.
//

#import "YLPClient+Reservation.h"
#import "YLPQuery.h"
#import "YLPQueryPrivate.h"
#import "YLPClientPrivate.h"
#import "YLPSearch.h"
#import "YLPResponsePrivate.h"

@implementation YLPClient (Reservation)

// GET https://api.yelp.com/v3/bookings/{business-id}/openings
- (void)bookBusinessID:(NSString *)businessID
	   reservationTime:(NSString *)time
	   reservationDate:(NSString *)date
	 reservationCovers:(NSUInteger)covers
	 completionHandler:(YLPSearchCompletionHandler)completionHandler {
	NSString *path = [NSString stringWithFormat:@"/v3/bookings/%@/openings", businessID];
	NSDictionary *params = @{
		@"covers" : @(covers),
		@"date" : date,
		@"time" : time
		};
	NSURLRequest *req = [self requestWithPath:path params:params];
	
    [self queryWithRequest:req completionHandler:^(NSDictionary *responseDict, NSError *error) {
        if (error) {
            completionHandler(nil, error);
        } else {
            YLPSearch *search = [[YLPSearch alloc] initWithDictionary:responseDict];
            completionHandler(search, nil);
        }
		
    }];
}

- (void)searchWithLocation:(NSString *)location
					  term:(NSString *)term
					 limit:(NSUInteger)limit
					offset:(NSUInteger)offset
					  sort:(YLPSortType)sort
		   reservationTime:(NSString *)time
		   reservationDate:(NSString *)date
		 reservationCovers:(NSUInteger)covers
		 completionHandler:(YLPSearchCompletionHandler)completionHandler {
	YLPQuery *query = [[YLPQuery alloc] initWithLocation:location];
	query.term = term;
	query.limit = limit;
	query.offset = offset;
	query.sort = sort;
	query.reservation_time = time;
	query.reservation_date = date;
	query.reservation_covers = covers;
	[self searchWithQuery:query completionHandler:completionHandler];
}

@end
