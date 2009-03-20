//
//  AboutViewController.m
//


#import "AboutViewController.h"

#define kOffset 5.0

@implementation AboutViewController

-(id)init {
	self = [super init];
	if (self) {
		self.title = @"About GitHub Mobile";
		self.tabBarItem.image = [UIImage imageNamed:@"octocat_small.png"];
	}
	return self;
}

-(void)loadView {
	UIView *firstView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"server.png"]];
	[firstView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
	[firstView setBackgroundColor:[UIColor yellowColor]];
	self.view = firstView;
	[firstView release];
	
	UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
	[label setTextAlignment:UITextAlignmentCenter];
	[label setFont:[UIFont systemFontOfSize:16.0]];
	[label setTextColor:[UIColor blackColor]];
	[label setBackgroundColor:[UIColor clearColor]];
	label.text = @"GitHub Mobile App\n by \n\n Sam Schroeder\nAlex Wayne\nScott Chacon\n";
	label.numberOfLines = 8;
	[label sizeToFit];
	label.frame = CGRectMake(0.0, 180.0, 340.0, label.frame.size.height);
	[self.view addSubview:label];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}


@end
