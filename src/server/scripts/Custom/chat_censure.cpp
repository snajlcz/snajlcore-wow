#include "ScriptPCH.h"
#include "Channel.h"

class System_Censure : public PlayerScript
{
public:
        System_Censure() : PlayerScript("System_Censure") {}

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg)
        {
                CheckMessage(player, msg, lang, NULL, NULL, NULL, NULL);
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Player* receiver)
        {
                CheckMessage(player, msg, lang, receiver, NULL, NULL, NULL);
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Group* group)
        {
                CheckMessage(player, msg, lang, NULL, group, NULL, NULL);
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Guild* guild)
        {
                CheckMessage(player, msg, lang, NULL, NULL, guild, NULL);
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Channel* channel)
        {
                CheckMessage(player, msg, lang, NULL, NULL, NULL, channel);
        }

void CheckMessage(Player* player, std::string& msg, uint32 lang, Player* /*receiver*/, Group* /*group*/, Guild* /*guild*/, Channel* channel)
{
    //if (player->isGameMaster() || lang == LANG_ADDON)
            //return;

    // transform to lowercase (for simpler checking)
    std::string lower = msg;
    std::transform(lower.begin(), lower.end(), lower.begin(), ::tolower);

    uint8 cheksSize = 36;
    std::string checks[cheksSize];
    // Strony (Sites)
    checks[0] ="http://";
    checks[1] ="www";
    checks[2] ="www.";
    checks[3] ="wow-";
    checks[4] ="-wow";
    checks[5] =".ru";
    checks[6] =".net";
    checks[7] =".org";
    checks[8] =".com";
    checks[9] =".biz";
    checks[10] ="zapto";
    checks[11] ="no-ip";
    checks[12] =".lt";
    checks[13] ="jeba";
    checks[14] ="cip";
    checks[15] ="gej";
    checks[16] ="cwel";
    checks[17] ="pizd";
    checks[18] ="pierdo";
    checks[19] ="spierd";
    checks[20] ="zjeb";
    checks[21] ="bitch";
    checks[22] ="clit";
    checks[23] ="wowflag";
    checks[24] ="uwow";
    checks[25] ="RiverRise";
    checks[26] ="isengard";
    checks[27] ="wowcircle";
    checks[28] ="jet-wow";
    checks[29] ="wow-cool";
    checks[30] ="fakewow";
    checks[31] ="spzone";
    checks[32] ="wowgear";
    checks[33] ="izbooshka";
    checks[34] ="sirus";
    checks[35] ="elgracia";
    for (int i = 0; i < cheksSize; ++i)
        if (lower.find(checks[i]) != std::string::npos)
        {
            msg = "";
            ChatHandler(player).PSendSysMessage("Advertising and vulgar behavior is not allowed!");
            return;
        }
}
};

void AddSC_System_Censure()
{
    new System_Censure();
}