//
//  RepositoriesViewController.h
//  git-phone
//
//  Created by Sam Schroeder on 1/27/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "RepositoryTableCellView.h"

@interface RepositoriesViewController : UITableViewController {
	RootViewController *rootViewController;
	NSArray *repositories;
  
  IBOutlet RepositoryTableCellView *masterTableCell;
}

@property (nonatomic, retain) RootViewController *rootViewController;
@property (nonatomic, retain) NSArray *repositories;

@end
