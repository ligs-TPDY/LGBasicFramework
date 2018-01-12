//
//  说明文档.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/26.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
    == 基本数据类型比较的是数值，对象比较的是地址
    isEqual 比较的是对象的值
 
    对于系统的类，已经封装好了isEqual的相关方法，但对于自定义的类，需要自己定义isEqual方法，见CustomEqual类
 */

/**
    .哈希算法将任意长度的二进制值映射为固定长度的较小二进制，这个小的二进制成为哈希值
    .哈希值是一段数据唯一且极其紧凑的数值表示
    .哈希算法又称散列函数或者单向数字函数
    .哈希是一种单向密码体制，即他是一个从明文到密文的不可逆的映射
    .哈希算法有两个基本特点：可重复和不可逆。即不同的原文理论上可能得到相同的哈希值，也正因为如此，从哈希值推出原文是不可能的
    .如果散列一段明文而且哪怕只改段落的一个字母，随后的哈希都将产生不同的值。要找到散列为同一个值的两个不同的输入，在计算机上来说是基本不可能的
    .所有散列函数都有如下一个基本特征：如果两个散列值是不相同的（根据同一函数），那么这两个散列值的原始输入也是不相同的。这个特性使得散列函数具有确定性的结果。
     但另一方面，散列函数的输入和输出不是一一对应的，如果两个散列值相等，两个输入值很可能相等，但并不能绝对肯定二者相等。
     输入一些数据计算出散列值，然后部分改变输入值，一个具有强混淆特性的散列函数会产生一个完全不同的散列值。
    .Hash,一般翻译做“散列”，也有直接音译为“哈希”的。就是把任意长度的输入，通过散列算法，变换成固定长度的输出，该输出值就是散列值。这种转换是一种压缩映射，也就是，散列值的空间通常元小于输入烦人空间。不同的输入可能散列成相同的输出，所以不可能从散列值来唯一确定输入值。简单的说就是一种将任意长度的消息压缩到某一固定长度的消息摘要的函数。
    .对不同的关键字可能得到同一散列地址，即key1不等于key2，而f（key1）=f（key2），这种现象称碰撞。具有相同函数值的关键字对该散列函数来说称为同义词。
  
    .消息身份验证代码（MAC）哈希函数通常与数字签名一起用于对数据进行签名
    .消息检测代码（MDC）哈希函数用于数据完整性
 */

/**
    为什么要有hash方法?
    这个问题要从Hash Table这种数据结构说起
    首先我们看下如何在数组中查找某个成员
    Step 1: 遍历数组中的成员
    Step 2: 将取出的值与目标值比较, 如果相等, 则返回该成员
    在数组未排序的情况下, 查找的时间复杂度是O(array_length)
    为了提高查找的速度, Hash Table出现了
    当成员被加入到Hash Table中时, 会给它分配一个hash值, 以标识该成员在集合中的位置
    通过这个位置标识可以将查找的时间复杂度优化到O(1), 当然如果多个成员都是同一个位置标识, 那么查找就不能达到O(1)了
    重点来了:
    分配的这个hash值(即用于查找集合中成员的位置标识), 就是通过hash方法计算得来的, 且hash方法返回的hash值最好唯一
    和数组相比, 基于hash值索引的Hash Table查找某个成员的过程就是
    Step 1: 通过hash值直接找到查找目标的位置
    Step 2: 如果目标位置上有多个相同hash值得成员, 此时再按照数组方式进行查找
    hash方法什么时候被调用?
    带着这个问题, 我们来看下面的例子
    Person *person1 = [Person personWithName:kName1 birthday:self.date1];
    Person *person2 = [Person personWithName:kName2 birthday:self.date2];
 
    NSMutableArray *array1 = [NSMutableArray array];
    [array1 addObject:person1];
    NSMutableArray *array2 = [NSMutableArray array];
    [array2 addObject:person2];
    NSLog(@"array end -------------------------------");
 
    NSMutableSet *set1 = [NSMutableSet set];
    [set1 addObject:person1];
    NSMutableSet *set2 = [NSMutableSet set];
    [set2 addObject:person2];
    NSLog(@"set end -------------------------------");
 
    NSMutableDictionary *dictionaryValue1 = [NSMutableDictionary dictionary];
    [dictionaryValue1 setObject:person1 forKey:kKey1];
    NSMutableDictionary *dictionaryValue2 = [NSMutableDictionary dictionary];
    [dictionaryValue2 setObject:person2 forKey:kKey2];
    NSLog(@"dictionary value end -------------------------------");
 
    NSMutableDictionary *dictionaryKey1 = [NSMutableDictionary dictionary];
    [dictionaryKey1 setObject:kValue1 forKey:person1];
    NSMutableDictionary *dictionaryKey2 = [NSMutableDictionary dictionary];
    [dictionaryKey2 setObject:kValue2 forKey:person2];
    NSLog(@"dictionary key end -------------------------------");
    为了看清楚hash方法是否被调用, 我们重写hash方法如下
    - (NSUInteger)hash {
    NSUInteger hash = [super hash];
    NSLog(@"hash = %ld", hash);
    return hash;
    }
    打印结果如下
    person1 == person2 = NO
    [person1 isEqual:person2] = NO
    isEqual end -------------------------------
    array end -------------------------------
    hash = 7809196951631946839
    hash = 7809196951631946839
    hash = 7809191961023760480
    hash = 7809191961023760480
    set end -------------------------------
    dictionary value end -------------------------------
    hash = 7809196951631946839
    hash = 7809196951631946839
    hash = 7809191961023760480
    hash = 7809191961023760480
    dictionary key end -------------------------------
    从打印结果可以看到:
    hash方法只在对象被添加至NSSet和设置为NSDictionary的key时会调用
    NSSet添加新成员时, 需要根据hash值来快速查找成员, 以保证集合中是否已经存在该成员
    NSDictionary在查找key时, 也利用了key的hash值来提高查找的效率
*/

/**
    hash方法与判等的关系?
    hash方法主要是用于在Hash Table查询成员用的, 那么和我们要讨论的isEqual()有什么关系呢?
    为了优化判等的效率, 基于hash的NSSet和NSDictionary在判断成员是否相等时, 会这样做
    Step 1: 集成成员的hash值是否和目标hash值相等, 如果相同进入Step 2, 如果不等, 直接判断不相等
    Step 2: hash值相同(即Step 1)的情况下, 再进行对象判等, 作为判等的结果
    简单地说就是
    hash值是对象判等的必要非充分条件
 */

/**
    如何重写自己的hash方法?
    很多人在iOS开发中, 都是这么重写hash方法的
    - (NSUInteger)hash {
        return [super hash];
    }
    这样写有问题么? 带着这个问题, 我们先来看下[super hash]的值到底是什么
    Person *person = [[Person alloc] init];
    NSLog(@"person = %ld", (NSUInteger)person);
    NSLog(@"[person1 getSuperHash] = %ld", [person getSuperHash]);
    打印结果如下
    person = 140643147498880
    [person1 getSuperHash] = 140643147498880
    由此可以看出, [super hash]返回的就是该对象的内存地址
    联想到前面对hash值唯一性的要求, 使用对象的内存地址作为hash值不是很好么?
    别急, 我们添加如下两个对象到NSSet中试试
    Person *person1 = [Person personWithName:kName1 birthday:self.date1];
    Person *person2 = [Person personWithName:kName1 birthday:self.date1];
    NSLog(@"[person1 isEqual:person2] = %@", [person1 isEqual:person2] ? @"YES" : @"NO");
 
    NSMutableSet *set = [NSMutableSet set];
    [set addObject:person1];
    [set addObject:person2];
    NSLog(@"set count = %ld", set.count);
    此时打印结果如下
    [person1 isEqual:person2] = YES
    set count = 2
    isEqual相等的两个对象都加入到了NSSet中(set count = 2), 所以直接返回[super hash]是不正确的
    那么hash方法的最佳实践到底是什么呢?
    大神Mattt Thompson在Equality中给出的结论就是
    In reality, a simple XOR over the hash values of critical properties is sufficient 99% of the time(对关键属性的hash值进行位或运算作为hash值)
    对于上面Person类的hash方法实现如下
    - (NSUInteger)hash {
        return [self.name hash] ^ [self.birthday hash];
    }
 */
