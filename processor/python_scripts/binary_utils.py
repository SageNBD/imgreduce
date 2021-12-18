# -*- coding: utf-8 -*-
"""
Created on Sat Dec 18 10:19:06 2021

@author: vitor
"""

def bin2dec(bin_str):
    power = 7
    val = 0
    for ch in bin_str:
        val += (ch == '1') << power
        power += -1
    return val

def dec2bin(num):
    res = ''
    while num > 0:
        res += str(num % 2)
        num = num // 2
    
    while len(res) < 8:
        res += "0"
        
    return res[::-1]