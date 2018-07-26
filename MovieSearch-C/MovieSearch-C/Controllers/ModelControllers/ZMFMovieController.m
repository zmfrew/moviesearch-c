//
//  ZMFMovieController.m
//  MovieSearch-C
//
//  Created by Zachary Frew on 7/26/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

#import "ZMFMovieController.h"
#import "ZMFMovie.h"
#import <UIKit/UIKit.h>

@implementation ZMFMovieController

// MARK: - Singleton
+ (ZMFMovieController *)sharedController
{
    static ZMFMovieController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [ZMFMovieController new];
    });
    return sharedController;
}

// MARK: - URL Methods
- (NSURL *)baseURL
{
    return [NSURL URLWithString:@"https://api.themoviedb.org/3/search/movie"];
}

- (NSURL *)baseImageURL
{
    return [NSURL URLWithString:@"http://image.tmdb.org/t/p/w500/"];
}

// MARK: - Methods
- (void)retrieveMoviesWithSearchText:(NSString *)searchText completion:(void (^)(NSArray<ZMFMovie *> *))completion
{
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:[self baseURL] resolvingAgainstBaseURL:true];
    NSURLQueryItem *apiKeyQuery = [NSURLQueryItem queryItemWithName:@"api_Key" value:@"c5c1f4910df19b60d4b5657cf2225704"];
    NSURLQueryItem *languageQuery = [NSURLQueryItem queryItemWithName:@"language" value:@"en-US"];
    NSURLQueryItem *movieSearchQuery = [NSURLQueryItem queryItemWithName:@"query" value:searchText];
    urlComponents.queryItems = @[apiKeyQuery, languageQuery, movieSearchQuery];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:urlComponents.URL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error occurred fetching movies: %@", error);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error occurred: no data returned from request.");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *resultsArray = jsonDictionary[@"results"];
        NSMutableArray *movies = [NSMutableArray new];
        
        for (NSDictionary *movieDictionary in resultsArray) {
            ZMFMovie *movie = [[ZMFMovie alloc] initWithDictionary:movieDictionary];
            [movies addObject:movie];
        }
        
        completion(movies);
        
    }] resume];
    
}

- (void)retrieveImageForMovie:(ZMFMovie *)movie completion:(void (^)(UIImage *))completion
{
    NSURL *imageURL = [[self baseImageURL] URLByAppendingPathComponent:movie.imageURLExtension];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error occurred fetching movies: %@", error);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error occurred: no data returned from request.");
            completion(nil);
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        
        completion(image);
        
    }] resume];
    
}


@end
