//
//  RepositoriesViewController.m
//  git-phone
//
//  Created by Sam Schroeder on 1/27/09.
//  Copyright 2009 Proton Microsystems, LLC. All rights reserved.
//

#import "RepositoriesViewController.h"
#import "RepoCommitsViewController.h"

// TODO : split (owned, collaborator, watched) - tabs?

@implementation RepositoriesViewController

@synthesize rootViewController;
@synthesize repositories;
@synthesize publicFlag;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"Repositories";
	[Repository loadAll];
	if(publicFlag) {
		self.repositories = [[Config instance] publicRepositories];
	} else {
		self.repositories = [[Config instance] privateRepositories];
	}
	NSLog(@"Loaded");
	// get repositories if we don't have them
}


- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
  // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return [RepositoryTableCellView cellHeight];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1; 
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [repositories count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"RepositoryTableCellView";
  
  RepositoryTableCellView *cell = (RepositoryTableCellView *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[RepositoryTableCellView alloc] init] autorelease];
  }
  
  // Set up the cell...
  cell.repository = (Repository *)[repositories objectAtIndex:[indexPath row]];
  return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	RepoCommitsViewController *repoCommitsViewController = [[[RepoCommitsViewController alloc] initWithNibName:@"RepoCommitsView" bundle:nil] autorelease];
	Repository *repository = [repositories objectAtIndex:[indexPath row]];
	
	[repoCommitsViewController.repoCommits release];
	[repository.commits release];
	[repository loadCommits];
	repoCommitsViewController.repoCommits = repository.commits;
	
	[self.navigationController pushViewController:repoCommitsViewController animated:YES];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)dealloc {
	[repositories release];
	[rootViewController release];
	[super dealloc];
}


@end

