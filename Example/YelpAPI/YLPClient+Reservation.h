//
//  YLPClient+Reservation.h
//  YelpAPI
//
//  Created by Oleg Zjuz on 08.12.2019.
//

#import <UIKit/UIKit.h>
#import "YLPClient.h"
#import "YLPSortType.h"
#import "YLPClient+Search.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLPClient (Reservation)

- (void)bookBusinessID:(NSString *)businessID
	   reservationTime:(NSString *)time
	   reservationDate:(NSString *)date
	 reservationCovers:(NSUInteger)covers
	 completionHandler:(YLPSearchCompletionHandler)completionHandler;

- (void)searchWithLocation:(NSString *)location
					  term:(nullable NSString *)term
					 limit:(NSUInteger)limit
					offset:(NSUInteger)offset
					  sort:(YLPSortType)sort
		   reservationTime:(NSString *)time
		   reservationDate:(NSString *)date
		 reservationCovers:(NSUInteger)covers
		 completionHandler:(YLPSearchCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
