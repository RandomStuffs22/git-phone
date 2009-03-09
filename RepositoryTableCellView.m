//
//  RepositoryTableCellView.m
//  git-phone
//
//  Created by Alex Wayne on 3/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RepositoryTableCellView.h"


@implementation RepositoryTableCellView

@synthesize iconImage, nameLabel, ownerLabel, lastCommitMessageLabel;

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
  
  nameLabel.text = self.repository.name;
  ownerLabel.text = self.repository.owner;
  
  Commit *lastCommit = (Commit *)[self.repository.commits objectAtIndex:0];
  lastCommitMessageLabel.text = lastCommit.message;
}

- (void)dealloc {
  NSLog(@"dealloc repo table cell");
  [repository release];
  [super dealloc];
}


@end
