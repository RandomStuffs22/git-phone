//
//  Repository.h
//  git-phone
//
//  Created by Sam Schroeder on 1/19/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//


@interface Repository : NSObject {
	NSString *name;
	NSString *owner;
	NSString *description;
	NSNumber *watchers;
	NSNumber *forks;
	NSNumber *privateRepo;
	NSMutableArray *commits;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *owner;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSNumber *watchers;
@property (nonatomic, retain) NSNumber *forks;
@property (nonatomic, retain) NSNumber *privateRepo;
@property (nonatomic, retain) NSMutableArray *commits;

+ (NSString *)indexURL;
+ (void)loadAll;
- (NSString *)commitsURL;
- (void)loadCommits;

@end
