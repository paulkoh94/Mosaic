#ifndef DRAGON_H //Include/Header Guard
#define DRAGON_H //Include/Header Guard

#include <iostream>
#include <string>
#include <cstdlib>
#include <vector>
#include <iomanip>
using namespace std;

enum dragonSize { tiny, small, medium, large, huge};

class Dragon{
 public:
  Dragon(string name, string type, bool isHatched, dragonSize curSize,
         dragonSize maxSize, int rarity);
  string GetName();
  void SetName(string name);
  string GetType();
  void SetType(string Type);
  bool GetIsHatched();
  void HatchDragon();
  dragonSize GetCurSize();
  void SetCurSize(dragonSize curSize);
  dragonSize GetMaxSize();
  void SetMaxSize(dragonSize maxSize);
  int GetRarity();
  void SetRarity(int rarity);
  bool AttemptGrow();
  bool AttackDragon(Dragon&);
  string BreathAttack();
 private:
  string m_name; //Name of Dragon
  string m_type; //Type of Dragon(water, fire, ice, acid, or wind)
  bool m_isHatched; //Egg or Hatched?
  dragonSize m_curSize; //What is the current dragon size?
  dragonSize m_maxSize; //What is the maximum dragon size?
  int m_rarity; //How rare is the dragon type (1-10)
};

#endif //Exit Header Guard      
