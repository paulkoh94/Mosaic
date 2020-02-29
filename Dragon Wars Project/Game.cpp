#include "Game.h"
#include <ctime>
#include <iomanip>
#include<iostream>
using namespace std;

Game::Game(){

  //Seed time to create pseudo random numbers
  srand(time(NULL));

  cout << "Welcome to Dragon Wars" << endl;
  cout << "What is your name?" << endl;
  getline(cin, m_name);

  LoadDragons();
}
//*********************************************
void Game::LoadDragons(){
  fstream inputStream; //Will input the .txt file into here
  inputStream.open(DRAGON_DATA.c_str());

  //This block of code will keep implementing until the end of the .txt file
  while(!inputStream.eof()){
    string d_name; //name of dragon from txtfile
    string d_type; //type of dragon from txtfile
    string max_size; //max size of dragon from txtfile
    string rarity; //rarity of dragon from txtfile

    //Extracts data delimited by commas
    getline(inputStream, d_name, ',');
    getline(inputStream, d_type, ',');
    getline(inputStream, max_size, ',');
    getline(inputStream, rarity);

    int sizeInt = atoi(max_size.c_str()); //converts from string to int
    //variable below: converts the int into dragonSize
    //-1 from int to make it equal dragonSize huge
    dragonSize convertedSize = static_cast<dragonSize>(sizeInt-1);
    int convertedRarity = atoi(rarity.c_str()); //converts from string to int
    Dragon loadDragon(d_name, d_type, false, tiny, convertedSize, convertedRarity);
    m_dragons.push_back(loadDragon); //dragon object that is loaded into m_drag
  }
  //pop back in order to delete an unwanted element
  m_dragons.pop_back();
  inputStream.close();
}

//************************************************************
int Game::MainMenu(){
  int selection;

  cout << "What would you like to do?" << endl;
  cout << "1. Search for an egg " << endl;
  cout << "2. Try to hatch egg " << endl;
  cout << "3. Display all dragons and eggs " << endl;
  cout << "4. Attack! " << endl;
  cout << "5. Quit " << endl;
  cin >> selection;

  return selection;
}

//***********************************************************
void Game::StartGame(){
   int selection;

   do{

     int numHatchedEggs = 0; //This will get incremented for each hatched drag
     for(unsigned int x = 0; x < m_myDragons.size(); x++){
       if(m_myDragons[x].GetIsHatched() == true)
         numHatchedEggs++;
     }

     m_countHatchedDragons = numHatchedEggs;

     //MainMenu() will return an int into this selection variable
     selection = MainMenu();

     switch(selection){
     case 1:
       SearchEgg();
       break;
     case 2:
       HatchEgg();
       break;
     case 3:
       DisplayMyDragons();
       break;
     case 4:
       Attack();
       break;
     case 5:
       cout << "Thanks for playing " << m_name << endl;
     }
  }while(selection !=5);

 }
//***********************************************************

void Game::SearchEgg(){
  int rarityInput; //takes in the input to select rarity of egg
  int correctIndex; //The correct index for the rarity of the egg will be stored here

  do{
  cout << "What rarity egg would you like to search for?" << endl;
  cout << "Enter rarity (1 = very common and 10 = very rare): " << endl;
  cin >> rarityInput;
  }while(rarityInput < 1 || rarityInput > 10);

    // 91/100 chance that user will find an egg
  if((rand()%100) < (100 - (rarityInput*9))){
      //This loop will keep going until we generate a random index of a dragon
      //that has the same rarity as the inputted value
      do{
	correctIndex = rand()%167;
      }while(rarityInput != m_dragons[correctIndex].GetRarity());
      //Once the correct index is found the dragon is pushed back into the myDragons vector
      m_myDragons.push_back(m_dragons[correctIndex]);
      cout << "You found a " << m_dragons[correctIndex].GetName() << " egg!" << endl;
    }else
      cout << "Sorry, you did not find a dragon of that rarity" << endl;
}

//***********************************************************
void Game::HatchEgg(){
  //If there are no dragons in myDragons vector then back to main menu
  if(m_myDragons.empty()){
    cout << "You currently have no eggs to hatch" << endl;
    return;
  }

  unsigned int userInput; //store user input to decide which egg to hatch

  DisplayMyDragons();

  do{
  cout << "Which dragon would you like to try and hatch?" << endl;
  cin >> userInput;
  }while(userInput < 1 || userInput > m_myDragons.size());

  //If the dragon is hatched then back to main menu
  if(m_myDragons[userInput-1].GetIsHatched() == true){
    cout << "This dragon is already hatched." << endl;
    return;
  }

  // 1/2 chance of the egg hatching into a dragon
  if((rand()%2 + 1) == 1){
    m_myDragons[userInput-1].HatchDragon();
    cout << "Your " << m_myDragons[userInput-1].GetName() << "  hatches into a dragon!" << endl;
  }
    else
      cout << "Your egg did not hatch." << endl;
}

//***********************************************************
void Game::DisplayMyDragons(){
  //If no dragons in myDragons vector then back to main menu
  if(m_myDragons.empty()){
    cout << "You currently have no dragons or eggs" << endl;
    return;
  }

  cout << "******************************" << endl;
  cout << m_name << "'s Dragons" << endl;
  cout << setw(30) << "Name" << setw(8) << right << "Type";
  cout << setw(12) << "Egg/Dragon" << setw(14) << right << "Current Size";
  cout << setw(10) << right << "Max Size" << endl;


  for(unsigned int x = 0; x < m_myDragons.size(); x++){
    cout << setw(3) << (x+1) << ".";
    cout << setw(26) << right << m_myDragons[x].GetName();
    cout << setw(8) << right << m_myDragons[x].GetType();

    //the if else loop will determine whether the display prints
    // "egg" or "dragon"
    if(m_myDragons[x].GetIsHatched() == false)
      cout << setw(12) << right << "egg";
    else
      cout << setw(12) << right << "dragon";
    cout << setw(14) << right << m_myDragons[x].GetCurSize()+1;
    cout << setw(10) << right << m_myDragons[x].GetMaxSize()+1 << endl;
}
  cout << "******************************" << endl;
}

//***********************************************************
void Game::Attack(){

     //If there are no hatched dragons then back to main menu
     if(m_countHatchedDragons == 0){
       cout << "You currently have no hatched dragons." << endl;
       return;
     }

     int randomIndex; //stores a random index of a dragon
     randomIndex = rand()%167; //Random number range 0-166 is assigned

     //The variables below are traits of enemy dragon
     string enemyName = m_dragons[randomIndex].GetName();
     string enemyType = m_dragons[randomIndex].GetType();
     dragonSize enemySize = static_cast<dragonSize>(rand()%(m_dragons[randomIndex].GetMaxSize()+1));
     dragonSize enemyMax = m_dragons[randomIndex].GetMaxSize();
     int enemyRarity = m_dragons[randomIndex].GetRarity();

     cout << "Attack!" << endl;
     cout << "You found a " << enemyName;
     cout << " to fight!" << endl;

     char fightChoice; //Variable to used to choose to fight or run away
     unsigned int dragonChoice; //The dragon player will use to fight enemy

     do{
     cout << "Do you want to fight it? (y/n)" << endl;
     cin >> fightChoice;
     }while(fightChoice != 'y' && fightChoice != 'n');

     //If user inputs 'n' back to main menu
     if(fightChoice == 'n'){
       cout << "You ran away from the " << enemyName << endl;
       return;
     }

     //An object is created for the enemy Dragon
     Dragon enemyDragon(enemyName, enemyType, true, enemySize, enemyMax, enemyRarity);

     //If User inputs 'y' Choose which dragon to take to battle
     if(fightChoice == 'y'){
       DisplayMyDragons();
       do{
	 do{
	   cout << "Which dragon would you like to fight with? " << endl;
	   cin >> dragonChoice;
	 }while(dragonChoice < 1 || dragonChoice > m_myDragons.size());

	 //If the chosen Dragon is not hatched then choose again
	 if(m_myDragons[dragonChoice - 1].GetIsHatched() == false)
           cout << "You cannot attack with an egg!" << endl;
       }while(m_myDragons[dragonChoice - 1].GetIsHatched() == false);

       unsigned int choiceIndex = dragonChoice - 1; //This will be index for chosen dragon



       //5% Chance that the dragon will breath on the enemy and defeat it
       if(rand()%100 < 5){
	 cout <<  m_myDragons[choiceIndex].BreathAttack();
	 cout << " on the enemy " << enemyName << " and defeats it" << endl;
	 //User's dragon will attempt to grow if it is not yet max size
	 if(m_myDragons[choiceIndex].AttemptGrow() == true)
	   cout << "Your dragon grows a bit larger" << endl;
	 return;
	   }


       cout << "Your " << m_myDragons[choiceIndex].GetName();
       cout << " attacks the " << enemyName << "!" << endl;

       //If enemy Dragon kills player's dragon
       if(m_myDragons[choiceIndex].AttackDragon(enemyDragon) == false)
	 m_myDragons.erase(m_myDragons.begin()+choiceIndex); //If enemy dragon defeats user's dragon
	                                                     //that dragon is erased from vector

	 //If player's dragon wins or draws
       else if(m_myDragons[choiceIndex].AttemptGrow() == true)
	   cout << "Your dragon grows a bit larger" << endl;
     }
}
//***********************************************************
void Game::DisplayAllDragons(){
  cout << "Displaying Dragons....." << endl;
  for(unsigned int x = 0; x < m_dragons.size(); x++){
    cout << m_dragons[x].GetName() << ", " << m_dragons[x].GetType() << ", " << m_dragons[x].GetMaxSize() << ", " << m_dragons[x].GetRarity() << endl;
  }
}
