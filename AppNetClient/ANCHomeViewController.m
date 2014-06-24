//
//  ANCHomeViewController.m
//  AppNetClient
//
//  Created by Zeke Shearer on 6/23/14.
//  Copyright (c) 2014 Zeke Shearer. All rights reserved.
//

#import "ANCHomeViewController.h"
#import "ANCDataController.h"
#import "ANCPostTableViewCell.h"

@interface ANCHomeViewController ()

@property (nonatomic, strong) NSArray *posts;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) UITableViewController *tableViewController;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIView *innerLoadingView;

@end

@implementation ANCHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ANCPostTableViewCell" bundle:nil] forCellReuseIdentifier:ANCPostTableViewCellIdentifier];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshData:) forControlEvents:UIControlEventValueChanged];
    
    self.tableViewController = [[UITableViewController alloc] initWithStyle:self.tableView.style];
    self.tableViewController.tableView = self.tableView;
    self.tableViewController.refreshControl = self.refreshControl;
    
    self.posts = [[ANCDataController instance] existingPosts];
    
    if ( !self.posts.count ) {
        [self showLoadingView];
    }
    
    [self.tableView reloadData];
    [self refreshData:nil];
    
}

- (void)refreshData:(id)sender
{
    [self showLoadingView];
    [[ANCDataController instance] fetchPostsWithCompletion:^(BOOL success, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if ( error ) {
                [[[UIAlertView alloc] initWithTitle:@"Error Refreshing Posts" message:error.description delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
            } else {
                self.posts = [[ANCDataController instance] existingPosts];
                [self.tableView reloadData];
            }
            if ( self.refreshControl.isRefreshing ) {
                [self.refreshControl endRefreshing];
            }
            [self hideLoadingView];
        });
    }];
}

- (void)showLoadingView
{
    self.loadingView.frame = self.view.bounds;
    self.innerLoadingView.layer.cornerRadius = 10;
    [self.view addSubview:self.loadingView];
}

- (void)hideLoadingView
{
    [UIView animateWithDuration:.2 animations:^{
        self.loadingView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.loadingView removeFromSuperview];
        self.loadingView = nil;
    }];
}

#pragma mark - TableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.posts.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ANCPost *post;
    UILabel *sizingLabel;
    CGSize size;
    
    post = self.posts[indexPath.row];
    
    sizingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width-50, 12)];
    sizingLabel.numberOfLines = 0;
    sizingLabel.text = post.postText;
    [sizingLabel sizeToFit];
    
    size = [sizingLabel textRectForBounds:sizingLabel.bounds limitedToNumberOfLines:0].size;
    size.height += 40;
    
    return 84 > size.height ? 84 : size.height;
    
    return size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ANCPostTableViewCell *cell;
    ANCPost *post;
    
    post = self.posts[indexPath.row];
    
    cell = [tableView dequeueReusableCellWithIdentifier:ANCPostTableViewCellIdentifier];
    cell.post = post;
    return cell;
}

#pragma mark - Rotation Methods

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.tableView reloadData];
}

@end
