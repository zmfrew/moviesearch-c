//
//  ZMFMovie.h
//  MovieSearch-C
//
//  Created by Zachary Frew on 7/26/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMFMovie : NSObject

NS_ASSUME_NONNULL_BEGIN

// MARK: - Properties
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) float rating;
@property (nonatomic, copy, readonly) NSString *overview;
@property (nonatomic, copy, readonly) NSString *imageURLExtension;

// MARK: - Initializers
- (instancetype)initWithTitle:(NSString *)title
                       rating:(float)rating
                     overview:(NSString *)overview
            imageURLExtension:(NSString *)imageURLExtension;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

NS_ASSUME_NONNULL_END

@end
