#ifndef MIPS_H
#define MIPS_H

#include <iostream>
#include <fstream>
#include <string>
#include <cstring>

using namespace std;

//performInstruction(): get the 32bit instruction string and do what I gotta do
int performInstruction(string instruction, bitset<32> memory[], bitset<32> registers[]);
//getOp(): Will get the 32 bit instruction and output a long that represents
// what instruction we need to run
long getOp(string instruction);
//r-type instructions
void addu(string instruction, bitset<32> registers[]);
void subu(string instruction, bitset<32> registers[]);
void andr(string instruction, bitset<32> registers[]);
void orr(string instruction, bitset<32> registers[]);
void norr(string instruction, bitset<32> registers[]);
//i-type instructions
void addiu(string instruction, bitset<32> registers[], bitset<32> memory[]);
long beq(string instruction, bitset<32> registers[], bitset<32> memory[]);
void lw(string instruction, bitset<32> registers[], bitset<32> memory[]);
void sw(string instruction, bitset<32> registers[], bitset<32> memory[]);
//j-type instructions
long j(string instruction);

#endif
