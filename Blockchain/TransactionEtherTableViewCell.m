//
//  TransactionEtherTableViewCell.m
//  Blockchain
//
//  Created by kevinwu on 8/30/17.
//  Copyright © 2017 Blockchain Luxembourg S.A. All rights reserved.
//

#import "TransactionEtherTableViewCell.h"
#import "EtherTransaction.h"
#import "NSDateFormatter+TimeAgoString.h"
#import "TransactionDetailViewController.h"
#import "TransactionDetailNavigationController.h"
#import "RootService.h"

@implementation TransactionEtherTableViewCell

- (void)reload
{
    if (self.transaction == NULL) return;
    
    if (self.transaction.time > 0) {
        self.dateLabel.adjustsFontSizeToFitWidth = YES;
        self.dateLabel.hidden = NO;
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.transaction.time];
        self.dateLabel.text = [NSDateFormatter timeAgoStringFromDate:date];
    } else {
        self.dateLabel.hidden = YES;
    }
    
    if (self.transaction.confirmations >= kConfirmationEtherThreshold) {
        self.ethButton.alpha = 1;
        self.actionLabel.alpha = 1;
    } else {
        self.ethButton.alpha = 0.5;
        self.actionLabel.alpha = 0.5;
    }
    
    self.ethButton.titleLabel.minimumScaleFactor = 0.75f;
    self.ethButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self.ethButton setTitle:app->symbolLocal ? [NSNumberFormatter formatEthToFiatWithSymbol:self.transaction.amount exchangeRate:app.tabControllerManager.latestEthExchangeRate] : [NSNumberFormatter formatEth: self.transaction.amountTruncated] forState:UIControlStateNormal];
    [self.ethButton addTarget:self action:@selector(ethButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    if ([self.transaction.txType isEqualToString:TX_TYPE_TRANSFER]) {
        [self.ethButton setBackgroundColor:COLOR_TRANSACTION_TRANSFERRED];
        self.actionLabel.text = [BC_STRING_TRANSFERRED uppercaseString];
        self.actionLabel.textColor = COLOR_TRANSACTION_TRANSFERRED;
    } else if ([self.transaction.txType isEqualToString:TX_TYPE_RECEIVED]) {
        [self.ethButton setBackgroundColor:COLOR_TRANSACTION_RECEIVED];
        self.actionLabel.text = [BC_STRING_RECEIVED uppercaseString];
        self.actionLabel.textColor = COLOR_TRANSACTION_RECEIVED;
    } else {
        [self.ethButton setBackgroundColor:COLOR_TRANSACTION_SENT];
        self.actionLabel.text = [BC_STRING_SENT uppercaseString];
        self.actionLabel.textColor = COLOR_TRANSACTION_SENT;
    }
    
    self.actionLabel.frame = CGRectMake(self.actionLabel.frame.origin.x, 29, self.actionLabel.frame.size.width, self.actionLabel.frame.size.height);
    self.dateLabel.frame = CGRectMake(self.dateLabel.frame.origin.x, 11, self.dateLabel.frame.size.width, self.dateLabel.frame.size.height);
}

- (void)transactionClicked
{
    TransactionDetailViewController *detailViewController = [TransactionDetailViewController new];
    TransactionDetailViewModel *model = [[TransactionDetailViewModel alloc] initWithEtherTransaction:self.transaction exchangeRate:app.tabControllerManager.latestEthExchangeRate defaultAddress:[app.wallet getEtherAddress]];
    detailViewController.transactionModel = model;

    TransactionDetailNavigationController *navigationController = [[TransactionDetailNavigationController alloc] initWithRootViewController:detailViewController];
    navigationController.transactionHash = model.myHash;
    
    detailViewController.busyViewDelegate = navigationController;
    navigationController.onDismiss = ^() {
        app.tabControllerManager.transactionsEtherViewController.detailViewController = nil;
    };
    navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    app.tabControllerManager.transactionsEtherViewController.detailViewController = detailViewController;
    
    if (app.topViewControllerDelegate) {
        [app.topViewControllerDelegate presentViewController:navigationController animated:YES completion:nil];
    } else {
        [app.window.rootViewController presentViewController:navigationController animated:YES completion:nil];
    }
}

- (void)ethButtonClicked
{
    [self transactionClicked];
}

@end
