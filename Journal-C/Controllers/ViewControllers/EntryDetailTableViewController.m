//
//  EntryDetailTableViewController.m
//  Journal-C
//
//  Created by Travis Chapman on 10/30/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

#import "EntryDetailTableViewController.h"


@interface EntryDetailTableViewController ()

#pragma mark - Outlets

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

#pragma mark - Actions

- (IBAction)clearButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)viewWasTapped:(UITapGestureRecognizer *)sender;

@end

@implementation EntryDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_entry) {
        _titleTextField.text = _entry.title;
        _bodyTextView.text = _entry.body;
    }
}

- (IBAction)clearButtonTapped:(UIBarButtonItem *)sender {
    
    _titleTextField.text = @"";
    _bodyTextView.text = @"";
    
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    if (_titleTextField.text && _titleTextField.text.length > 0 &&
        _bodyTextView.text && _bodyTextView.text.length > 0)
    {
        NSString *title = _titleTextField.text;
        NSString *body = _bodyTextView.text;
        
        if (_entry == nil) {
        TCEntry *entry = [[TCEntry alloc] initWithTitle:title body:body timestamp:nil];
        [TCEntryController.shared addEntryWith:entry];
        } else {
            [TCEntryController.shared updateWith:_entry newTitle:title newBody:body];
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        return;
    }
}

- (IBAction)viewWasTapped:(UITapGestureRecognizer *)sender {
    
    [self.view endEditing:YES];
}

@end
