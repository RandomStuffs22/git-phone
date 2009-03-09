//
//  RepositoryTableCellView.m
//  git-phone
//
//  Created by Alex Wayne on 3/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RepositoryTableCellView.h"


@implementation RepositoryTableCellView

@synthesize nameLabel;

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

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
  if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
    // Initialization code
  }
  return self;
}

- (void)setRepository:(Repository *)newRepository {
  if (self.repository != newRepository) {
    [repository release];
    repository = [newRepository retain];
  }
  
  [self layoutSubviews];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  nameLabel.text = self.repository.name;
}

- (void)dealloc {
  NSLog(@"dealloc repo table cell");
  [repository release];
  [super dealloc];
}


@end
