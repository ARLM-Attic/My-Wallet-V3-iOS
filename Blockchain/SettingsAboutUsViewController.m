//
//  SettingsAboutUsViewController.m
//  Blockchain
//
//  Created by Kevin Wu on 11/7/16.
//  Copyright © 2016 Blockchain Luxembourg S.A. All rights reserved.
//

#import "SettingsAboutUsViewController.h"
#import "RootService.h"

@interface SettingsAboutUsViewController ()
@end

@implementation SettingsAboutUsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_BLOCKCHAIN_BLUE;
    
    CGFloat imageWidth = self.view.frame.size.width - 120;
    
    UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - imageWidth)/2, 100, imageWidth, 80)];
    logoImageView.image = [UIImage imageNamed:@"blockchain_b_large"];
    logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:logoImageView];
    
    UIImageView *bannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - imageWidth)/2, logoImageView.frame.origin.y + logoImageView.frame.size.height + 16, imageWidth, 50)];
    bannerImageView.image = [UIImage imageNamed:@"blockchain_wallet_logo"];
    bannerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:bannerImageView];
    
    CGFloat labelWidth = self.view.frame.size.width - 30;

    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - labelWidth)/2, bannerImageView.frame.origin.y + bannerImageView.frame.size.height + 16, labelWidth, 90)];
    infoLabel.textAlignment = NSTextAlignmentCenter;
    infoLabel.textColor = [UIColor whiteColor];
    infoLabel.numberOfLines = 3;
    infoLabel.text = [NSString stringWithFormat:@"%@ %@\n%@\n%@", ABOUT_STRING_BLOCKCHAIN_WALLET, [app getVersionLabelString], [NSString stringWithFormat:@"%@ %@ %@", ABOUT_STRING_COPYRIGHT_LOGO, COPYRIGHT_YEAR, ABOUT_STRING_BLOCKCHAIN_LUXEMBOURG_SA], BC_STRING_BLOCKCHAIN_ALL_RIGHTS_RESERVED];
    
    [self.view addSubview:infoLabel];
    
    [self addButtonsWithWidth:labelWidth - 30 belowView:infoLabel];
}

- (void)addButtonsWithWidth:(CGFloat)buttonWidth belowView:(UIView *)aboveView
{
    UIButton *rateUsButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - buttonWidth)/2, aboveView.frame.origin.y + aboveView.frame.size.height + 16, buttonWidth, 40)];
    rateUsButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rateUsButton setTitle:BC_STRING_RATE_US forState:UIControlStateNormal];
    [self.view addSubview:rateUsButton];
    [rateUsButton addTarget:self action:@selector(rateApp) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *merchantAppButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - buttonWidth)/2, rateUsButton.frame.origin.y + rateUsButton.frame.size.height + 16, buttonWidth, 40)];
    merchantAppButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [merchantAppButton setTitle:BC_STRING_FREE_MERCHANT_APP forState:UIControlStateNormal];
    [self.view addSubview:merchantAppButton];
    [merchantAppButton addTarget:self action:@selector(getMerchantApp) forControlEvents:UIControlEventTouchUpInside];
}

- (void)rateApp
{
    [app rateApp];
}

- (void)getMerchantApp
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[APP_STORE_LINK_PREFIX stringByAppendingString:APP_STORE_ID_MERCHANT]]];
}

@end
