//
//  HashAES.m
//  Crypto
//
//  Created by Pavlo Boiko on 21.04.18.
//  Copyright © 2018 Pavlo Boiko. All rights reserved.
//

#import "include/HashAES.h"
#import "include/cryptonight.h"

@interface HashAES()
    @property (nonatomic, readonly) struct cryptonight_ctx *ctx;
@end

@implementation HashAES
    
- (instancetype)init {
    if (self = [super init]) {
        _ctx = (struct cryptonight_ctx*)malloc(sizeof(struct cryptonight_ctx));
    }
    return self;
}
    
- (void)dealloc {
    if (_ctx) {
        free(_ctx);
        _ctx = NULL;
    }
}
    
- (NSData * _Nonnull)hashData:(NSData * _Nonnull)data {
    NSMutableData *output = [NSMutableData dataWithLength:32];
    cryptonight_hash_ctx(output.mutableBytes, data.bytes, self.ctx);
    return output;
}
    
    
@end
