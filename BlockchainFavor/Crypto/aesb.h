//
//  aesb.h
//  Pods
//
//  Created by Pavlo Boiko on 4/17/18.
//

#ifndef aesb_h
#define aesb_h

void aesb_single_round(const uint8_t *in, uint8_t *out, uint8_t *expandedKey);
void aesb_pseudo_round_mut(uint8_t *val, uint8_t *expandedKey);

#endif /* aesb_h */
