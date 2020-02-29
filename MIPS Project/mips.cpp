#include "mips.h"

using namespace std;

int performInstruction(string instruction, bitset<32> memory[], bitset<32> registers[]){
  //Get Opcode
  long op = getOp(instruction);
  bool rtype;

  //check for rtype instruction and get rtype op if rtype
  if(op == 0){
    string opString;
    char *p;

    rtype = true;
    //cout << "R-Type Instruction Found" << endl;
    opString = instruction.substr(26, 6);
    op = strtol(opString.c_str(), &p, 2);
    //cout << "Rtype Op:" << op << endl;
  }else
    rtype = false;

  //Execute the instruction depending on if its r-type or not
  if(rtype == true){
    //cout << "Execute R-type Instruction" << endl;
    //addu
    if(op == 33){
      cout << "execute addu" << endl;
      addu(instruction, registers);
    }
    //subu
    else if(op == 35){
      cout << "execute subu" << endl;
      subu(instruction, registers);
    }
    //and
    else if(op == 36){
      cout << "execute and" << endl;
      andr(instruction, registers);
    }
    //or
    else if(op == 37){
      cout << "execute or" << endl;
      orr(instruction, registers);
    }
    //nor
    else if(op == 39){
      cout << "execute nor" << endl;
      norr(instruction, registers);
    }
    else{
      cout << "could not execute instruction" << endl;
      return 0;
    }
  //
  }else{
    //cout << "Execute I-type or J-type Instruction" << endl;
    //addiu
    if(op == 9){
      cout << "execute addiu" << endl;
      addiu(instruction, registers, memory);
      return 0;
    }
    //beq
    else if(op == 4){
      cout << "execute beq" << endl;
      return beq(instruction, registers, memory);
    }
    //j
    else if(op == 2){
      cout << "execute j" << endl;
      return j(instruction);
    }
    //lw
    else if(op == 35){
      cout << "execute lw" << endl;
      lw(instruction,registers, memory);
      return 0;
    }
    //sw
    else if(op == 43){
      cout << "execute sw" << endl;
      sw(instruction,registers, memory);
      return 0;
    }
    //halt
    else if(op == 63){
      //cout << "execute halt" << endl;
      return -1;
    }
    else{
      cout << "could not execute instruction" << endl;
      return 0;
    }

    return 0;
  }
  return 0;
}

long getOp(string instruction){
  //cout << "Calling getOp()" << endl;
  char *p;
  string opString = instruction.substr(0,6);
  //cout << "The first 6 bits of instruction are: " << opString << endl;
  long instructionLong = strtol(opString.c_str(), &p, 2);
  //cout << "Op:" << instructionLong << endl;
  return instructionLong;
}

void addu(string instruction, bitset<32> registers[]){
  char *p;
  string rsString = instruction.substr(6,5);
  string rtString = instruction.substr(11,5);
  string rdString = instruction.substr(16,5);
  long rsIndex = strtol(rsString.c_str(), &p, 2);
  long rtIndex = strtol(rtString.c_str(), &p, 2);
  long rdIndex = strtol(rdString.c_str(), &p, 2);

  registers[rdIndex] = registers[rsIndex].to_ulong() + registers[rtIndex].to_ulong();
}

void subu(string instruction, bitset<32> registers[]){
  char *p;
  string rsString = instruction.substr(6,5);
  string rtString = instruction.substr(11,5);
  string rdString = instruction.substr(16,5);
  long rsIndex = strtol(rsString.c_str(), &p, 2);
  long rtIndex = strtol(rtString.c_str(), &p, 2);
  long rdIndex = strtol(rdString.c_str(), &p, 2);

  registers[rdIndex] = registers[rsIndex].to_ulong() - registers[rtIndex].to_ulong();
}

void andr(string instruction, bitset<32> registers[]){
  char *p;
  string rsString = instruction.substr(6,5);
  string rtString = instruction.substr(11,5);
  string rdString = instruction.substr(16,5);
  long rsIndex = strtol(rsString.c_str(), &p, 2);
  long rtIndex = strtol(rtString.c_str(), &p, 2);
  long rdIndex = strtol(rdString.c_str(), &p, 2);

  registers[rdIndex] = registers[rsIndex] & registers[rtIndex];
}

void orr(string instruction, bitset<32> registers[]){
  char *p;
  string rsString = instruction.substr(6,5);
  string rtString = instruction.substr(11,5);
  string rdString = instruction.substr(16,5);
  long rsIndex = strtol(rsString.c_str(), &p, 2);
  long rtIndex = strtol(rtString.c_str(), &p, 2);
  long rdIndex = strtol(rdString.c_str(), &p, 2);

  registers[rdIndex] = registers[rsIndex] | registers[rtIndex];
}

void norr(string instruction, bitset<32> registers[]){
  char *p;
  string rsString = instruction.substr(6,5);
  string rtString = instruction.substr(11,5);
  string rdString = instruction.substr(16,5);
  long rsIndex = strtol(rsString.c_str(), &p, 2);
  long rtIndex = strtol(rtString.c_str(), &p, 2);
  long rdIndex = strtol(rdString.c_str(), &p, 2);

  registers[rdIndex] = ~(registers[rsIndex] | registers[rtIndex]);
}

void addiu(string instruction, bitset<32> registers[], bitset<32> memory[]){
  char *p;
  string rsString = instruction.substr(6,5);
  string rdString = instruction.substr(11,5);
  string immString = instruction.substr(16,16);
  long rsIndex = strtol(rsString.c_str(), &p, 2);
  long rdIndex = strtol(rdString.c_str(), &p, 2);
  long immLong = strtol(immString.c_str(), &p, 2);

  registers[rdIndex] = registers[rsIndex].to_ulong() + immLong;
}

long beq(string instruction, bitset<32> registers[], bitset<32> memory[]){
  char *p;
  string rsString = instruction.substr(6,5);
  string rdString = instruction.substr(11,5);
  string immString = instruction.substr(16,16);
  long rsIndex = strtol(rsString.c_str(), &p, 2);
  long rdIndex = strtol(rdString.c_str(), &p, 2);
  long immLong = strtol(immString.c_str(), &p, 2);

  if(registers[rdIndex] == registers[rsIndex])
    return immLong;
  else
    return 0;
}

void lw(string instruction, bitset<32> registers[], bitset<32> memory[]){
  char *p;
  string rsString = instruction.substr(6,5);
  string rdString = instruction.substr(11,5);
  string immString = instruction.substr(16,16);
  long rsIndex = strtol(rsString.c_str(), &p, 2);
  long rdIndex = strtol(rdString.c_str(), &p, 2);
  long immLong = strtol(immString.c_str(), &p, 2);

  registers[rdIndex] = memory[rsIndex + immLong];
}

void sw(string instruction, bitset<32> registers[], bitset<32> memory[]){
  char *p;
  string rsString = instruction.substr(6,5);
  string rdString = instruction.substr(11,5);
  string immString = instruction.substr(16,16);
  long rsIndex = strtol(rsString.c_str(), &p, 2);
  long rdIndex = strtol(rdString.c_str(), &p, 2);
  long immLong = strtol(immString.c_str(), &p, 2);

  memory[rsIndex + immLong] = registers[rdIndex];
}

long j(string instruction){
  char *p;
  string jumpString = instruction.substr(6,26);
  long jumpLong = strtol(jumpString.c_str(), &p, 2);

  return jumpLong;
}
