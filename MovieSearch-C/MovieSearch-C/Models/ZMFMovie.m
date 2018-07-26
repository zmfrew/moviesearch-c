//
//  ZMFMovie.m
//  MovieSearch-C
//
//  Created by Zachary Frew on 7/26/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import "ZMFMovie.h"

@implementation ZMFMovie

// MARK: - Initializers
- (instancetype)initWithTitle:(NSString *)title rating:(float)rating overview:(NSString *)overview imageURLExtension:(NSString *)imageURLExtension
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _rating = rating;
        _overview = [overview copy];
        _imageURLExtension = [imageURLExtension copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[[ZMFMovie titleKey]];
    float rating = [dictionary[[ZMFMovie ratingKey]] floatValue];
    NSString *overview = dictionary[[ZMFMovie overviewKey]];
    NSString *imageURLExtension = dictionary[[ZMFMovie imageURLExtensionKey]];
    
    return [self initWithTitle:title rating:rating overview:overview imageURLExtension:imageURLExtension];
}

// MARK: - Property Method

+ (NSString *)titleKey
{
    return @"original_title";
}

+ (NSString *)ratingKey
{
    return @"vote_average";
}

+ (NSString *)overviewKey
{
    return @"overview";
}

+ (NSString *)imageURLExtensionKey
{
    return @"poster_path";
}

@end
