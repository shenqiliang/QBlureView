//
//  QBlurDemoViewController.m
//  QBlurView
//
//  Created by brightshen on 13-11-5.
//  Copyright (c) 2013年 brightshen. All rights reserved.
//

#import "QBlurDemoViewController.h"
#import "QBlurView.h"

@interface QBlurDemoViewController ()
@property(nonatomic, retain) QBlurView *blurView;
@end

@implementation QBlurDemoViewController

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
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DisplayImage"]];
    [self.view addSubview:imageView];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"synchronized",@"asynchronized"]];
    seg.selectedSegmentIndex = 1;
    [seg addTarget:self action:@selector(segChanged:) forControlEvents:UIControlEventValueChanged];
    seg.center = CGPointMake(160, 420);
    [self.view addSubview:seg];

    self.blurView = [[QBlurView alloc] initWithFrame:CGRectMake(60, 120, 200, 200)];
    [self.view addSubview:self.blurView];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGesture];
}

- (void)segChanged:(UISegmentedControl*)seg{
    self.blurView.synchronized = seg.selectedSegmentIndex==0;
}

- (void)pan:(UIPanGestureRecognizer*)panGesture{
    CGPoint offset = [panGesture locationInView:self.view];
    self.blurView.center = offset;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
