# -*- coding: utf-8 -*-
"""
Created on Fri Dec 17 21:38:05 2021

@author: vitor
"""

from binary_utils import dec2bin, bin2dec

def produce_c_array():     
    array_decl = "int img_arr[] = { "
    count = 0
    
    for i in range(1, 11):
        if i < 10:    
            filename = f'in0{i}.txt'
        else:
            filename = 'in10.txt'
            
        lines = []
        with open(filename, "r") as f:
            lines = f.readlines()
        
        for line in lines:
            line = line.strip()
            num = bin2dec(line)
            array_decl += f"{num}, "
            
    array_decl += " };" 
    
    with open("out_num.txt", "w") as f:
        f.write(array_decl)
        
    print(count)
    
def produce_integer_file():
    count = 0
    numbers = []
    
    for i in range(1, 11):
        if i < 10:    
            filename = f'binary_strings\\in0{i}.txt'
        else:
            filename = 'binary_strings\\in10.txt'
            
        lines = []
        with open(filename, "r") as f:
            lines = f.readlines()
        
        for line in lines:
            line = line.strip()
            numbers.append(bin2dec(line))
            count += 1
    
    with open("out.txt", "w") as f:
        for num in numbers:
            f.write(f'{num}\n')
        
    print(count)

def write_output_image():
    lines = []
    with open('out.txt', 'r') as f:
        lines = f.readlines()
    
    integer_values = []
    for line in lines:
        line = line.strip()
        integer_values.append(int(line))
        
    with open('image_out.bin', 'wb') as f:
        f.write(bytearray(integer_values))

write_output_image()
