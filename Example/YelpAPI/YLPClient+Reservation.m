//
//  YLPClient+Reservation.m
//  YelpAPI
//
//  Created by Oleg Zjuz on 08.12.2019.
//

#import "YLPClient+Reservation.h"
#import "YLPQuery.h"
#import "YLPQueryPrivate.h"

@implementation YLPClient (Reservation)

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
