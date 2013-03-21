/* SPGM Memeber of Trinitycore Server: http://immortalones.game-server.cc Repo: http://code.google.com/p/spgm-trinity/
*  This is a script I combined from Buff Npc and professions, I have redesigned it and added to it. To come: Enchanting, Guildhouse, TeleNpc2, Bots so this will be a all in one NPC with options in the config file and Database.
*/

/* ScriptData
SDName: pryds_allinone
SD%Complete: 100
SDComment: Buff Master Profession SkillUp Trainers
SDCategory: NPC
INSERT INTO `creature_template` VALUES ('993369', '0', '0', '0', '0', '0', '26789', '0', '0', '0', 'MMOwning All-in-One', '', '', '0', '80', '80', '0', '35', '35', '1', '1', '1.14286', '0.75', '2', '1755', '1755', '0', '1504', '1000', '1500', '0', '1', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1', '100', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'pryds_allinone', '1');
EndScriptData */

#include "ScriptPCH.h"

class pryds_allinone : public CreatureScript
{
    public:

        pryds_allinone()
            : CreatureScript("pryds_allinone")
        {
        }

        struct pryds_allinoneAI : public ScriptedAI
        {
	    //*** HANDLED FUNCTION ***
        //This is the constructor, called only once when the Creature is first created
            pryds_allinoneAI(Creature *c) : ScriptedAI(c) {}   
        }; 



bool OnGossipHello(Player  *player, Creature* pCreature)
{
	// Main Menu for Alliance
    if (player->GetTeam() == ALLIANCE)
	{
                player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(4, "Morph ->"       			  , GOSSIP_SENDER_MAIN, 700);
	}
	else // Main Menu for Horde
	{
                player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(4, "Morph ->"       			  , GOSSIP_SENDER_MAIN, 700);
	}
    player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
    return true;
}

void SendDefaultMenu_pryds_allinone(Player  *player, Creature* pCreature, uint32 uiAction)
{
//  Not allow in combat
if (player->isInCombat())
{
    player->CLOSE_GOSSIP_MENU();
    pCreature->MonsterSay("You are in combat!", LANG_UNIVERSAL, NULL);
	return;
}

switch(uiAction)
{
case 700: //Morph
                player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(4, "Famous Morph->"   		    			       , GOSSIP_SENDER_MAIN, 710);
		player->ADD_GOSSIP_ITEM(4, "Funny Morph->" 							   , GOSSIP_SENDER_MAIN, 750);
		player->ADD_GOSSIP_ITEM(4, "DeMorph ->" 							   , GOSSIP_SENDER_MAIN, 799);

	player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 710: //Morph Famous
                player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(4, "Algalon ->"  		    			       , GOSSIP_SENDER_MAIN, 711);
		player->ADD_GOSSIP_ITEM(4, "Doomwalker ->" 						   , GOSSIP_SENDER_MAIN, 712);
		player->ADD_GOSSIP_ITEM(4, "Doomlord kazzak ->" 					   , GOSSIP_SENDER_MAIN, 713);
		player->ADD_GOSSIP_ITEM(4, "Onyxia ->" 							   , GOSSIP_SENDER_MAIN, 714);
		player->ADD_GOSSIP_ITEM(4, "Thaddius ->" 							   , GOSSIP_SENDER_MAIN, 715);
		player->ADD_GOSSIP_ITEM(4, "Gluth ->" 							   , GOSSIP_SENDER_MAIN, 716);
		player->ADD_GOSSIP_ITEM(4, "Maexxna ->" 							   , GOSSIP_SENDER_MAIN, 717);
		player->ADD_GOSSIP_ITEM(4, "Sapphiron->" 							   , GOSSIP_SENDER_MAIN, 718);
		player->ADD_GOSSIP_ITEM(4, "Noth The Plaguebringer->"				   , GOSSIP_SENDER_MAIN, 719);
		player->ADD_GOSSIP_ITEM(4, "Kel'Thuzad ->" 						   , GOSSIP_SENDER_MAIN, 720);
		player->ADD_GOSSIP_ITEM(4, "Kael'thas Sunstrider ->" 				   , GOSSIP_SENDER_MAIN, 721);
		player->ADD_GOSSIP_ITEM(4, "C'thun ->" 							   , GOSSIP_SENDER_MAIN, 722);
		player->ADD_GOSSIP_ITEM(4, "Thrall ->" 							   , GOSSIP_SENDER_MAIN, 723);
		player->ADD_GOSSIP_ITEM(4, "DeMorph ->" 							   , GOSSIP_SENDER_MAIN, 799);
		player->ADD_GOSSIP_ITEM(7, "<- Main Menu"                	           , GOSSIP_SENDER_MAIN, 5005);

	player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 750: //Morph Funny
                player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(4, "Gerky ->"   	 		   			       , GOSSIP_SENDER_MAIN, 751);
		player->ADD_GOSSIP_ITEM(4, "Fire elemental ->" 					   , GOSSIP_SENDER_MAIN, 752);
		player->ADD_GOSSIP_ITEM(4, "Pandaren Monk ->" 					   , GOSSIP_SENDER_MAIN, 753);
		player->ADD_GOSSIP_ITEM(4, "Lil' K.T ->" 					 		   , GOSSIP_SENDER_MAIN, 754);
		player->ADD_GOSSIP_ITEM(4, "The Weapon you're Wearing ->"	 	       , GOSSIP_SENDER_MAIN, 755);
		player->ADD_GOSSIP_ITEM(4, "Red Bubbles ->" 					       , GOSSIP_SENDER_MAIN, 756);
		player->ADD_GOSSIP_ITEM(4, "A Shark ->"    		   			       , GOSSIP_SENDER_MAIN, 757);
		player->ADD_GOSSIP_ITEM(4, "A Fel cannon ->"   	   			       , GOSSIP_SENDER_MAIN, 758);
		player->ADD_GOSSIP_ITEM(4, "Human Female  ->" 	   			       , GOSSIP_SENDER_MAIN, 759);
		player->ADD_GOSSIP_ITEM(4, "A Fat Human ->" 		   			       , GOSSIP_SENDER_MAIN, 760);
		player->ADD_GOSSIP_ITEM(4, "A Rabbit ->" 	 		   			       , GOSSIP_SENDER_MAIN, 761);
		player->ADD_GOSSIP_ITEM(4, "A Cool looking Bug ->"   			       , GOSSIP_SENDER_MAIN, 762);
		player->ADD_GOSSIP_ITEM(4, "Eye Of C'thun ->"   	   			       , GOSSIP_SENDER_MAIN, 763);
		player->ADD_GOSSIP_ITEM(4, "DeMorph ->" 							   , GOSSIP_SENDER_MAIN, 799);
		player->ADD_GOSSIP_ITEM(7, "<- Main Menu"                	           , GOSSIP_SENDER_MAIN, 5005);

	player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 5005: //Back To Main Menu
	// Main Menu for Alliance
    if (player->GetTeam() == ALLIANCE)
	{
                player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(4, "Morph ->"       			  , GOSSIP_SENDER_MAIN, 700);
	}
	else // Main Menu for Horde
	{
                player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(4, "Morph ->"       			  , GOSSIP_SENDER_MAIN, 700);
	}

	player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

//////////////////////////////////////////////////Morph ///////////////////////////////////////////////////////////////
//////////////////////////////////////////////////Famous ///////////////////////////////////////////////////////////////

case 711: // Algalon
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(28641);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.2f);
break;

case 712: // Doomwalker
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(16630);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.1f);
break;

case 713: // Doomlord kazzak
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(17887);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.10f);
break;

case 714: // Onyxia
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(8570);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.1f);
break;

case 715: // Thaddius
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(16137);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.2f);
break;

case 716: // Gluth
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(16064);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.2f);
break;

case 717: // Maexxna
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(15928);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.15f);
break;

case 718: // Sapphiron
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(16033);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.1f);
break;

case 719: // Noth The Plaguebringer
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(16590);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.7f);
break;

case 720: // Kel'Thuzad
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(15945);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.2f);
break;

case 721: // Kael'thas Sunstrider
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(20023);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.5f);
break;

case 722: // C'thun
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(15786);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.1f);
break;

case 723: // Thrall
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(4527);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.0f);
break;

//////////////////////////////////////////////////Funny ///////////////////////////////////////////////////////////////

case 751: // Gerky
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(29348);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.5f);
break;

case 752: // Water elemental
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(12129);
		player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.3f);
break;

case 753: // Pandaren Monk
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(30414);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.5f);
break;

case 754: // Lil' K.T
	player->CLOSE_GOSSIP_MENU();
	player->DeMorph();
    player->SetDisplayId(30507);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.5f);
break;

case 755: // The Weapon you're Wearing
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(15880);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.4f);
break;

case 756: // Red Bubbles
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(20262);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.5f);
break;

case 757: // A Shark
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(15555);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.2f);
break;

case 758: // A Fel cannon
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(18505);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.5f);
break;

case 759: // Human Female
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(100);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.5f);
break;

case 760: // A Fat Human
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(103);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.5f);
break;

case 761: // A Rabbit
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(328);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 3.0f);
break;

case 762: // A Cool looking Bug
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(15695);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.1f);
break;

case 763: // Eye Of C'thun
    player->CLOSE_GOSSIP_MENU();
	player->SetDisplayId(15556);
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.1f);
break;

case 771: // Make me Bigger
    player->CLOSE_GOSSIP_MENU();
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.5f);
break;

case 772: // Make me Smaller
    player->CLOSE_GOSSIP_MENU();
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.5f);
break;

case 799: // DeMorph
    player->CLOSE_GOSSIP_MENU();
	player->DeMorph();
	player->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.0f);
break;
 player->CLOSE_GOSSIP_MENU();

} // end of switch
} //end of function



bool OnGossipSelect(Player  *player, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
	// Main menu
	if (uiSender == GOSSIP_SENDER_MAIN)
	SendDefaultMenu_pryds_allinone(player, pCreature, uiAction);
return true;
}
};

void AddSC_pryds_allinone()
{
    new pryds_allinone();
}