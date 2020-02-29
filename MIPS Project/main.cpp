#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
//#include <bits/stdc++.h>
#include "mips.h"

using namespace std;


int main(){
  //bitset<32> instruction;
  bitset<32> memory[32];
  bitset<32> registers[32];
  fstream instructionStream;
  fstream memoryStream;
  string txtString;
  string instructionString;//store the .txt file strings into here
  int counter = 0; //will count to 4 so we can get full 32 bit instruction; also used to count memory index
  int instructionCounter = 0;//Keep track of instruction # so we can branch
  long branchCounter = 0;

  instructionStream.open("Instructions.txt");
  memoryStream.open("IMemory.txt");

  //Load up initial memory
  while(memoryStream >> txtString){
    char *p;
    memory[counter] = strtol(txtString.c_str(), &p, 2);
    //cout << memory[counter] << endl;
    counter++;
  }

  memoryStream.close();

  counter = 0;
  while(instructionStream >> txtString){
    //If branchCounter isn't 0 we need to skip lines to jump to an instruction
    if(branchCounter != 0){
      if(counter == 3){
        instructionCounter++;
        branchCounter--;
        //cout << "Instruction " << instructionCounter << endl;
        counter = 0;
        continue;
      }else{
        counter++;
        continue;
      }
    }

    if(counter == 3){
      // call getOp to see what instruction we need to call
      instructionCounter++;
      //cout << "Instruction " << instructionCounter << endl;
      instructionString = instructionString + txtString;
      //cout << instructionString << endl;
      branchCounter = performInstruction(instructionString, memory, registers);

      // if branch counter == -1, write to files before halting program
      if(branchCounter == -1){
        ofstream memoryOutput;
        ofstream registerOutput;
        cout << "halting program and writing to Memory.txt and Registers.txt" << endl;

        memoryOutput.open("Memory.txt");
        registerOutput.open("Registers.txt");

        //Write to Memory.txt and Registers.txt
        for(int i = 0; i < 32; i++){
          memoryOutput << memory[i] << endl;
          registerOutput << registers[i] << endl;
        }

        instructionStream.close();
        memoryOutput.close();
        registerOutput.close();
        return 0;
      }
      instructionString.clear();
      counter = 0;
    }
    else{
      instructionString = instructionString + txtString;
      //cout << instructionString << endl;
      counter++;
    }
  }

  return 0;

}
