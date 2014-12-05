//
//  BasicAnimationContorller.m
//  Core Animation Tutorial
//
//  Created by LU YAJUN  on 12/2/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "BasicAnimationContorller.h"

@interface BasicAnimationContorller ()

@property (strong,nonatomic) NSMutableArray *basicAnimationList;
@property (strong,nonatomic) NSMutableArray *detailAnimationList;


@end

@implementation BasicAnimationContorller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.basicAnimationList = [NSMutableArray arrayWithCapacity:5];
    self.detailAnimationList = [NSMutableArray arrayWithCapacity:5];
    
    NSArray *myArray =@[@"Simple Animation",@"Implicit Animation",@"Reflection",@"CAKeyframeAnimation",@"Mutiple Layers Animation"];
    NSArray *myDetailArray =@[@"Rotate,Scale,Move and Combine Animation",@"Change position, opacity,color,size and corner",@"Show Great Wall reflection",@"Arbitrary path Animation for motorcycle",@"Guess the numbers of poker using 3D animation"];
    
    self.basicAnimationList = [NSMutableArray arrayWithArray:myArray];
    self.detailAnimationList = [NSMutableArray arrayWithArray:myDetailArray];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.basicAnimationList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicAnimation" forIndexPath:indexPath];
    
    cell.textLabel.text= [self.basicAnimationList objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:20.0];
    cell.detailTextLabel.text=[self.detailAnimationList objectAtIndex:indexPath.row];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row==0) {
        
        [self performSegueWithIdentifier:@"s0" sender:self];
        
    }
    else if (indexPath.row==1)
        
    {
        [self performSegueWithIdentifier:@"s1" sender:self];
    }
    
    else if (indexPath.row==2)
        
    {
        [self performSegueWithIdentifier:@"s2" sender:self];
    }
    
    
    else if (indexPath.row==3)
        
    {
        [self performSegueWithIdentifier:@"s3" sender:self];
    }
    
    else if (indexPath.row==4)
        
    {
        [self performSegueWithIdentifier:@"s4" sender:self];
    }
    
    
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
