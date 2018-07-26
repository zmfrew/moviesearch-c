//
//  ZMFMovieController.h
//  MovieSearch-C
//
//  Created by Zachary Frew on 7/26/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ZMFMovie;

@interface ZMFMovieController : NSObject

// MARK: - Singleton
+ (instancetype)sharedController;

// MARK: - Methods
- (void)retrieveMoviesWithSearchText:(NSString *)searchText completion:(void (^) (NSArray<ZMFMovie *> *))completion;

- (void)retrieveImageForMovie:(ZMFMovie *)movie completion:(void (^) (UIImage *))completion;

@end
