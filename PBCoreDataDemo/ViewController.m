//
//  ViewController.m
//  PBCoreDataDemo
//
//  Created by wentao lu on 2021/4/21.
//

#import "ViewController.h"
#import "PBPerson+CoreDataProperties.h"
#import "PBPersonDataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *write = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [write setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [write setTitle:@"write" forState:UIControlStateNormal];
    [write addTarget:self action:@selector(write:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:write];
    
    UIButton *read = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    [read setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [read setTitle:@"read" forState:UIControlStateNormal];
    [read addTarget:self action:@selector(read:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:read];
}

- (void)read:(UIView *)sender {
    NSArray<NSArray *> *resArr = [PBPersonDataManager read];
    for (PBPerson *p in resArr) {
        NSLog(@"%@先生, %@岁了", p.name, @(p.age));
    }
}

- (void)write:(UIView *)write {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PBPerson" inManagedObjectContext:
                                   [PBPersonDataManager viewContext]];
    PBPerson *p = [[PBPerson alloc] initWithEntity:entity insertIntoManagedObjectContext:[PBPersonDataManager viewContext]];
    p.name = @"zql";
    p.age = 16;
    [PBPersonDataManager save:p];
}

@end

//更新data model的方法。
//1. 基于原data model新建data model2，并将当前data model版本切换为版本2
//2. 创建映射文件
//3. 重新生成NSManagedObject subclass（选中模型文件，editor）
