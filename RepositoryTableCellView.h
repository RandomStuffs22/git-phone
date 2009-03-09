//
//  RepositoryTableCellView.h
//  git-phone
//
//  Created by Alex Wayne on 3/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repository.h"
#import "Commit.h"

@interface RepositoryTableCellView : UITableViewCell {
  IBOutlet UIImageView *iconImage;
  IBOutlet UILabel *nameLabel;
  IBOutlet UILabel *ownerLabel;
  IBOutlet UILabel *lastCommitMessageLabel;
  IBOutlet UILabel *lastCommitAuthornameLabel;
  IBOutlet UILabel *lastCommitTimestampLabel;
  
  
  Repository *repository;
}

@property (nonatomic, retain) UIImageView *iconImage;
@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *ownerLabel;
@property (nonatomic, retain) UILabel *lastCommitMessageLabel;
@property (nonatomic, retain) UILabel *lastCommitAuthornameLabel;
@property (nonatomic, retain) UILabel *lastCommitTimestampLabel;
@property (nonatomic, retain) Repository *repository;

+ (NSUInteger)cellHeight;

@end
