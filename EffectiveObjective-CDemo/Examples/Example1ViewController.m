//
//  Example1ViewController.m
//  EffectiveObjective-CDemo
//
//  Created by bbigcd on 16/7/29.
//  Copyright © 2016年 cd. All rights reserved.
//

#import "Example1ViewController.h"
#import <objc/runtime.h>

@interface Example1ViewController ()

@end

@implementation Example1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self askUserAQuestion];
}

- (void)askUserAQuestion
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Question"
                                                    message:@"What do you want to do"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Continue", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
//        [self doCancel];
        NSLog(@"Cancel");
    }else{
//        [self doContinue];
        NSLog(@"Continue");
    }
}


/*
static void *EOCMyAlertViewKey = "EOCMyAlertViewKey";
- (void)askUserAQuestion
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Question"
                                                    message:@"What do you want to do"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Continue", nil];
    void (^block)(NSInteger) = ^(NSInteger buttonIndex)
    {
        if (buttonIndex == 0) {
//            [self doCancel];
            NSLog(@"Cancel");
        }else{
//            self doContinue];
            NSLog(@"Continue");
        }
    };
    
    objc_setAssociatedObject(alert,
                             EOCMyAlertViewKey,
                             block,
                             OBJC_ASSOCIATION_COPY);
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void (^block)(NSInteger) = objc_getAssociatedObject(alertView, EOCMyAlertViewKey);
    block(buttonIndex);
}
*/




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
