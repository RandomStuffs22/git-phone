//
//  RootViewController.m
//  git-phone
//
//  Created by Sam Schroeder on 1/16/09.
//  Copyright Proton Microsystems, LLC 2009. All rights reserved.
//

#import "RootViewController.h"
#import "git_phoneAppDelegate.h"
#import "RepositoriesViewController.h"
#import "AboutViewController.h"
#import "LoginViewController.h"


@implementation RootViewController



- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"GitHub Mobile";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (void) authenticate {
	// Check if username is set
	if ([[Config instance] hasLogin]) {
		[self loadLoginView];
	} else {
		if (![Connector didAuthenticateUser:[[Config instance] gitHubUserName] withToken:[[Config instance] gitHubToken]]) {
			[self loadLoginView];
		}
	}
}

- (bool) isAuthenticated {
	return [[Config instance] hasLogin];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
	NSInteger rows;
	
	switch(section) {
		case 0: {
			if ([self isAuthenticated]) {
				rows = 6;
			} else {
				rows = 1;
			}
			break;
		}
		case 1: {
			rows =  1;
			break;
		}
		case 2: {
			rows =  2;
			break;
		}
		case 3: {
			rows =  2;
			break;
		}
	}
	return rows;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GitHub"];
	if(cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	}

	switch(indexPath.section) {
		case 0: {
			if ([self isAuthenticated]) {
				switch(indexPath.row) {
					case 0: {
						cell.text = @"Public Repositories";
						cell.image = [UIImage imageNamed:@"public.png"];
						break;
					}
					case 1: {
						cell.text = @"Private Repositories";
						cell.image = [UIImage imageNamed:@"private.png"];
						break;
					}
					case 2: {
						cell.text = @"Commit Comments";
						cell.image = [UIImage imageNamed:@"comment.png"];
						break;
					}
					case 3: {
						cell.text = @"News Feed";
						cell.image = [UIImage imageNamed:@"feed.png"];
						break;
					}
					case 4: {
						cell.text = @"Messages";
						cell.image = [UIImage imageNamed:@"email.png"];
						break;
					}
					case 5: {
						cell.text = @"Your Profile";
						cell.image = [UIImage imageNamed:@"user.png"];
						break;
					}
				}
			} else {
				switch(indexPath.row) {
					case 0: {
						cell.text = @"Login to GitHub";
						cell.image = [UIImage imageNamed:@"public.png"];
						break;
					}
				}
			}
			break;
		}
		case 1: {
			switch(indexPath.row) {
				case 0: {
					cell.text = @"Local Repositories";
					cell.image = [UIImage imageNamed:@"transmit_blue.png"];
					break;
				}
			}
			break;
		}
		case 2: {
			switch(indexPath.row) {
				case 0: {
					cell.text = @"Search GitHub";
					cell.image = [UIImage imageNamed:@"zoom.png"];
					break;
				}
				case 1: {
					cell.text = @"Browse GitHub";
					cell.image = [UIImage imageNamed:@"book_open.png"];
					break;
				}
			}
			break;
		}
		case 3: {
			switch(indexPath.row) {
				case 0: {
					cell.text = @"Git Reference";
					cell.image = [UIImage imageNamed:@"git-favicon.png"];
					break;
				}
				case 1: {
					cell.text = @"About GitHub Mobile";
					cell.image = [UIImage imageNamed:@"octocat_small.png"];
					break;
				}
			}
			break;
		}
	}
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
	switch(indexPath.section) {
		case 0: {
			if ([self isAuthenticated]) {
				switch(indexPath.row) {
					case 0: {
						RepositoriesViewController *repositoriesViewController = [[[RepositoriesViewController alloc] initWithNibName:@"RepositoriesView" bundle:nil] autorelease];
						repositoriesViewController.publicFlag = true;
						repositoriesViewController.rootViewController = self;
						[self.navigationController pushViewController:repositoriesViewController animated:YES];
						break;
					}
					case 1: {
						RepositoriesViewController *repositoriesViewController = [[[RepositoriesViewController alloc] initWithNibName:@"RepositoriesView" bundle:nil] autorelease];
						repositoriesViewController.publicFlag = false;
						repositoriesViewController.rootViewController = self;
						[self.navigationController pushViewController:repositoriesViewController animated:YES];
						break;
					}
				}
			} else {
				// login to github
				LoginViewController *loginViewController = [[[LoginViewController alloc] initWithNibName:@"Login" bundle:nil] autorelease];
				[self.navigationController pushViewController:loginViewController animated:YES];
			}
			break;
		}
		case 1: {
			switch(indexPath.row) {
				case 0: {
					// LOCAL REPOS
					break;
				}
			}
			break;
		}
		case 2: {
			switch(indexPath.row) {
				case 0: {
					// NEWS FEED
					break;
				}
				case 1: {
					// GITHUB SEARCH
					break;
				}
			}
			break;
		}
		case 3: {
			switch(indexPath.row) {
				case 1: {
					// ABOUT PAGE
					AboutViewController *aboutViewController = [[AboutViewController alloc] init];
					//aboutViewController.rootViewController = self;
					[self.navigationController pushViewController:aboutViewController animated:YES];
					[tableView deselectRowAtIndexPath:indexPath animated:YES];					
					break;
				}
			}
			break;
		}
		[tableView deselectRowAtIndexPath:indexPath animated:YES];
	}
	
	

}


- (void)dealloc {
    [super dealloc];
}


@end

