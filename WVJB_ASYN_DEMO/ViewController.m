//
//  ViewController.m
//  WVJB_ASYN_DEMO
//
//  Created by 陈锋 on 13-6-5.
//  Copyright (c) 2013年 bri. All rights reserved.
//

#import "ViewController.h"
#import <WebViewJavascriptBridge/WebViewJavascriptBridge_iOS.h>
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    WebViewJavascriptBridge *bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView webViewDelegate:self handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"Received message from javascript: %@", data);
        responseCallback(@"Right back atc   ha");;
    }];
    
    [bridge registerHandler:@"fetchRemoteData" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSURL *baseURL = [NSURL URLWithString:@"http://api.dribbble.com"];
        AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
        [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [client setDefaultHeader:@"Accept" value:@"application/json"];
        [client getPath:@"/shots/21603" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@",responseObject);
            responseCallback(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            ;
        }];
        
    }];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    [self.webView loadHTMLString:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil] baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
