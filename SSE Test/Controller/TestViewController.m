//
//  TestViewController.m
//  SSE Test
//
//  Created by Shawn Wall on 7/9/13.
//  Copyright (c) 2013 TwoTap Labs. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

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
    self.title = @"SSE Test";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveSSEData:) name:@"SSEData" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)receiveSSEData:(NSNotification*)notification {
    NSDictionary *userInfo = notification.userInfo;
    self.textView.text = [NSString stringWithFormat:@"%@%@\n", self.textView.text, [userInfo valueForKey:@"data"]];
}

- (IBAction)pushTest:(id)sender {
    TestViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TestViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
