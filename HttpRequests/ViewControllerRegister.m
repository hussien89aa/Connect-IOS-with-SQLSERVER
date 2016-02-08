//
//  ViewControllerRegister.m
//  HttpRequests
//
//  Created by hussien alrubaye on 2/8/16.
//  Copyright © 2016 hussien alrubaye. All rights reserved.
//

#import "ViewControllerRegister.h"

@interface ViewControllerRegister ()
@property (weak, nonatomic) IBOutlet UITextField *laUserName;
@property (weak, nonatomic) IBOutlet UITextField *LaPassword;

@property (weak, nonatomic) IBOutlet UILabel *LaMessage;
@property (weak, nonatomic) IBOutlet UITextField *LaEmail;
@end

@implementation ViewControllerRegister

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Register:(id)sender {
    [self httpRequest];
}
-(void)httpRequest{
    NSString *myurl=[NSString stringWithFormat:@"http://selling.alruabye.net/UsersWS.asmx/Register?UserName=%@&Password=%@&Email=%@&PhoneNumber=4646&Logtit=11.5&Latitle=12.5",_laUserName.text, _LaPassword.text,_LaEmail.text];
    NSURL *URL = [NSURL URLWithString:myurl];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      // return data
                                      NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                                      //calll interface
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          NSString *Message=  [parsedObject objectForKey:@"Message"] ;
                                       
                                           _LaMessage.text=Message;
                                          
                                      });
                                      
                                      
                                      
                                  }];
    [task resume];
    
    
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
