#include "Dragon.h"
using namespace std;

Dragon::Dragon(string name, string type, bool isHatched, dragonSize curSize, dragonSize maxSize, int rarity){
  m_name = name;
  m_type = type;
  m_isHatched = isHatched;
  m_curSize = curSize;
  m_maxSize = maxSize;
  m_rarity = rarity;
}

string Dragon::GetName(){
  return m_name;
}

void Dragon::SetName(string name){
  m_name = name;
}

string Dragon::GetType(){
  return m_type;
}

void Dragon::SetType(string type){
  m_type = type;
}

bool Dragon::GetIsHatched(){
  return m_isHatched;
}

void Dragon::HatchDragon(){
  m_isHatched = true;
}

dragonSize Dragon::GetCurSize(){
  return m_curSize;
}

void Dragon::SetCurSize(dragonSize curSize){
  m_curSize = curSize;
}

dragonSize Dragon::GetMaxSize(){
  return m_maxSize;
}

void Dragon::SetMaxSize(dragonSize maxSize){
  m_maxSize = maxSize;
}

int Dragon::GetRarity(){
  return m_rarity;
}

void Dragon::SetRarity(int rarity){
  m_rarity = rarity;
}

bool Dragon::AttemptGrow(){
  bool attempt;
  int sizeInt;

  if(m_curSize != m_maxSize){
    sizeInt = m_curSize;
    sizeInt += 1;
    m_curSize = static_cast<dragonSize>(sizeInt);
    attempt = true;
  }
  else{
    cout << "Your dragon is max size" << endl;
    attempt = false;
  }

  return attempt;
}

bool Dragon::AttackDragon(Dragon &enemy){
  bool alive;

  //If enemy Dragon has higher current size
  if(enemy.m_curSize  > m_curSize){
    cout << "The enemy " << enemy.m_name << " defeated your ";
    cout << m_name << endl;
    alive = false;
    return alive;
    //If both dragons are equal in size
  }else if(enemy.m_curSize == m_curSize){
    cout << "The battle results in a draw. " << endl;
    alive = true;
    return alive;
    //If player's dragon size is larger than enemy
  }else{
    cout << "Your " << m_name;
    cout << " defeats the " << enemy.m_name << "!" << endl;
    alive = true;
    return alive;
  }

}

string Dragon::BreathAttack(){
  string breath = "Your " + m_name + " breathed " + m_type;

 return breath;
}
