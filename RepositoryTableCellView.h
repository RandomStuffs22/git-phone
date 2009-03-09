//
//  RepositoryTableCellView.h
//  git-phone
//
//  Created by Alex Wayne on 3/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repository.h"

@interface RepositoryTableCellView : UITableViewCell {
  IBOutlet UILabel *nameLabel;
  Repository *repository;
}

@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) Repository *repository;

+ (NSUInteger)cellHeight;

@end
