//
//  ViewController.m
//  WKWebView
//
//  Created by Alex on 16/10/9.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

#define Web_Url @"http://news.baidu.com/"

@interface ViewController ()<WKNavigationDelegate,WKUIDelegate>

@property(nonatomic,strong) WKWebView *webView;

@end

@implementation ViewController

-(WKWebView *)webView
{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
        _webView.navigationDelegate = self;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadWebView];
}

/**
 Xib 或者 StoryBoard 用WKWebView会崩溃？
 */
- (void)loadWebView
{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:Web_Url]]];
    [self.view addSubview:self.webView];
}

#pragma mark -
#pragma mark - 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    NSLog(@"页面开始加载时调用");
}

#pragma mark -
#pragma mark - 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    NSLog(@"当内容开始返回时调用");
}

#pragma mark -
#pragma mark - 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    NSLog(@"页面加载完成之后调用");
}

#pragma mark -
#pragma mark - 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"页面加载失败时调用");
}

#pragma mark -
#pragma mark - 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation
{
    NSLog(@"接收到服务器跳转请求之后调用");
}

#pragma mark -
#pragma mark - 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    NSLog(@"在收到响应后，决定是否跳转");
}

#pragma mark -
#pragma mark - 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigati
{
    NSLog(@"在发送请求之前，决定是否跳转");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
