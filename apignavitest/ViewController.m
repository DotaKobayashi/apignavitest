//
//  ViewController.m
//  apignavitest
//
//  Created by 小林堂太 on 2014/05/29.
//  Copyright (c) 2014年 dota.kobayashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

NSString *const AccessKey = @"hoge";

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                                          delegate:self
                                                     delegateQueue:[NSOperationQueue mainQueue]];
    
    NSString *api = [NSString stringWithFormat:@"http://api.gnavi.co.jp/ver1/RestSearchAPI/?keyid=%@&latitude=35.681382&longitude=139.766084&range=3", AccessKey];
    
    NSURL *url = [NSURL URLWithString:api];
    
    NSURLSessionTask *task = [session dataTaskWithURL:url];
    
    [task resume];

}

#pragma mark -
#pragma mark NSURLSessionDataDelegate
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    // NSData → NSString 変換
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", str);
}

@end
