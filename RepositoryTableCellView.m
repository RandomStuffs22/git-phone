//
//  RepositoryTableCellView.m
//  git-phone
//
//  Created by Alex Wayne on 3/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RepositoryTableCellView.h"


@implementation RepositoryTableCellView

@synthesize iconImage;
@synthesize nameLabel;
@synthesize ownerLabel;
@synthesize lastCommitMessageLabel;
@synthesize lastCommitAuthornameLabel;
@synthesize lastCommitTimestampLabel;

@synthesize repository;

+ (NSUInteger)cellHeight {
  return 100;
}

- (id)init {
  UIViewController *cellFactory = [[UIViewController alloc] initWithNibName:@"RepositoryTableCellView" bundle:nil];
  self = (RepositoryTableCellView *)[cellFactory.view retain];
  [cellFactory release];
  
  return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];

	if ([repository.privateRepo boolValue])
		iconImage.image = [UIImage imageNamed:@"private.png"];
	else
		iconImage.image = [UIImage imageNamed:@"public.png"];

	nameLabel.text = repository.name;
	ownerLabel.text = repository.owner;

	//Commit *lastCommit = (Commit *)[repository.commits objectAtIndex:0];
	// I removed last commit data from here, but didn't yet change the labels
	
	lastCommitMessageLabel.text = repository.description;
	lastCommitAuthornameLabel.text = [NSString stringWithFormat:@"Watchers: %@, Forks: %@", repository.watchers, repository.forks];
	lastCommitTimestampLabel.text = @"";
}

- (void)dealloc {
  [repository release];
  [super dealloc];
}


@end
