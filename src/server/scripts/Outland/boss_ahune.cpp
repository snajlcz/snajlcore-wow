/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */
#include "Log.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellAuras.h"
#include "GridNotifiers.h"
#include "ScriptPCH.h"
#include "LFGMgr.h"
#include "Player.h"
#include "Group.h"
#include "SpellInfo.h"

enum Creatures
{
    NPC_AHUNE                   = 25740,
    NPC_FROZEN_CORE             = 25865,
    NPC_AHUNITE_COLDWEAVE       = 25756,
    NPC_AHUNITE_FROSTWIND       = 25757,
    NPC_AHUNITE_HAILSTONE       = 25755,
    NPC_AHUNE_LOOT_LOC_BUNNY    = 25746,
};

enum Spells
{
    // Ahune
    SPELL_AHUNES_SHIELD         = 45954,
    SPELL_COLD_SLAP             = 46145,
    SPELL_ICE_SPIKE             = 46359, // summon ice spike bunny
    SPELL_MAKE_BONFIRE          = 45930,
    SPELL_SUMMONING_VISUAL1     = 45937, // below Ahune (?)
    SPELL_SUMMONING_VISUAL2     = 45938, // below the Summoning Stone (?)
    SPELL_SUMMON_MINION_VISUAL  = 46103, // Midsummer - Ahune - Summon Minion, Lower
    SPELL_RESURFACE             = 46402, // Ahune Resurfaces

    // Coldweave
    SPELL_BITTER_BLAST          = 46406,

    // Frostwind
    SPELL_LIGHTNING_SHIELD      = 12550,
    SPELL_WIND_BUFFET           = 46568,

    // Hailstone
    SPELL_CHILLING_AURA         = 46885, // periodic trigger
    SPELL_PULVERIZE             = 2676,
};

enum Events
{
    // Ahune
    EVENT_SUBMERGE              = 1,
    EVENT_EMERGE                = 2,
    EVENT_SUMMON_HAILSTONE      = 3,
    EVENT_SUMMON_COLDWEAVE      = 4,
    EVENT_SUMMON_FROSTWIND      = 5,
    EVENT_ICE_SPIKE             = 6,
    EVENT_COLD_SLAP             = 7,

    // Frozen Core
    EVENT_GHOST_VISUAL          = 8,
    EVENT_RESURFACE_SOON        = 9,

    // Coldweave
    EVENT_BITTER_BLAST          = 10,

    // Frostwind
    EVENT_WIND_BUFFET           = 11,

    // Hailstone
    EVENT_CHILLING_AURA         = 12,
    EVENT_PULVERIZE             = 13,
};

enum Phases
{
    PHASE_ONE    = 1,
    PHASE_TWO    = 2,
};

enum DataTypes
{
    // Encounter States/Boss GUIDs
    DATA_AHUNE            = 0,
};

#define GOSSIP_SUMMON "Disturb the Stone and summon Lord Ahune.";

// After GOSSIP_SUMMON was clicked
// Player says: The Ice stone has melted.
// Player says: Ahune, your strength grows no more!
// Player says: Your frozen reign will not come to pass!

Position const SummonPositions[5] =
{
        {-97.357f, -222.144f, -1.278f}, // Ahune / Frozen-Core
        {-97.357f, -222.144f, -1.278f}, // Hailstone
        {-85.854f, -212.931f, -1.552f}, // Coldweave #1
        {-109.56f, -213.421f, -1.397f}, // Coldweave #2
        {-99.459f, -191.873f, -1.705f}, // Loot Bunny
};

class boss_ahune : public CreatureScript
{
    public:
        boss_ahune() : CreatureScript("boss_ahune") { }

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_ahuneAI(creature);
        }

        struct boss_ahuneAI : public BossAI
        {
            boss_ahuneAI(Creature* creature) : BossAI(creature, DATA_AHUNE) { }

            EventMap events;
            //SummonList summons;

            uint64 frozenCoreGUID;

            void Reset()
            {
                summons.DespawnAll();

                events.Reset();
                events.SetPhase(PHASE_ONE);

                frozenCoreGUID = 0;

                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK_DEST, true);
				
                me->SetReactState(REACT_AGGRESSIVE);//test
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);//test
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
                me->HandleEmoteCommand(EMOTE_ONESHOT_EMERGE);
            }

            void EnterCombat(Unit* who)
            {
                DoZoneInCombat();

                events.Reset();
                events.SetPhase(PHASE_ONE);
                events.ScheduleEvent(EVENT_SUBMERGE, 90000); // phase 2 after 90 seconds
                events.ScheduleEvent(EVENT_COLD_SLAP, 500, 0, PHASE_ONE); // every 500ms in melee range in phase 1
                events.ScheduleEvent(EVENT_SUMMON_HAILSTONE, 1000, 0, PHASE_ONE); // once in every phase 1
                events.ScheduleEvent(EVENT_SUMMON_COLDWEAVE, 8000, 0, PHASE_ONE); // every 7 seconds in phase 1
                events.ScheduleEvent(EVENT_ICE_SPIKE, 8000, 0, PHASE_ONE); // every 5 seconds in phase 1, first after 8 seconds

                me->CastSpell(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), SPELL_SUMMONING_VISUAL1, true);
                me->AddAura(SPELL_AHUNES_SHIELD, me);
            }

            void JustDied(Unit* killer)
            {
                Map::PlayerList const& players = me->GetMap()->GetPlayers();
                if (!players.isEmpty() && players.begin()->GetSource()->GetGroup()->GetGUID())
                    sLFGMgr->FinishDungeon(players.begin()->GetSource()->GetGroup()->GetGUID(), 286);

                me->SummonCreature(NPC_AHUNE_LOOT_LOC_BUNNY, SummonPositions[4], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3000);
                summons.DespawnAll();
            }

            void JustSummoned(Creature* summoned)
            {
                DoZoneInCombat(summoned);

                summons.Summon(summoned);
            }

            void SummonedCreatureDespawn(Creature* summoned)
            {
                summons.Despawn(summoned);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_SUBMERGE:
                            events.SetPhase(PHASE_TWO);
                            events.ScheduleEvent(EVENT_EMERGE, 30000);
							
                            me->RemoveAurasDueToSpell(SPELL_AHUNES_SHIELD);
                            DoCast(me, SPELL_MAKE_BONFIRE);

                            me->SetReactState(REACT_PASSIVE);
                            me->AttackStop();
                            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
                            me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_SUBMERGED);
                            me->HandleEmoteCommand(EMOTE_ONESHOT_SUBMERGE);

                            // Emote: Ahune retreats. His defenses diminish.

                            // spawn core
                            if (Unit* frozenCore = me->SummonCreature(NPC_FROZEN_CORE, SummonPositions[0], TEMPSUMMON_CORPSE_DESPAWN))
                            {
                                frozenCoreGUID = frozenCore->GetGUID();
                                frozenCore->SetHealth(me->GetHealth()); // sync health on phase change
                            }
                            break;
                        case EVENT_EMERGE:
                            events.SetPhase(PHASE_ONE);
                            events.ScheduleEvent(EVENT_SUBMERGE, 90000);
                            events.ScheduleEvent(EVENT_SUMMON_HAILSTONE, 1000, 0, PHASE_ONE);
                            events.ScheduleEvent(EVENT_SUMMON_FROSTWIND, 9000, 0, PHASE_ONE);
                            events.ScheduleEvent(EVENT_SUMMON_COLDWEAVE, 8000, 0, PHASE_ONE);
                            events.ScheduleEvent(EVENT_ICE_SPIKE, 8000, 0, PHASE_ONE);
                            events.ScheduleEvent(EVENT_COLD_SLAP, 500, 0, PHASE_ONE);
							
                            me->AddAura(SPELL_AHUNES_SHIELD, me);
                            DoCast(me, SPELL_RESURFACE);
							
                            me->SetReactState(REACT_AGGRESSIVE);
                            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
                            me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
                            me->HandleEmoteCommand(EMOTE_ONESHOT_EMERGE);

                            // despawn core
                            if (Creature* frozenCore = me->GetCreature(*me, frozenCoreGUID))
                            {
                                me->SetHealth(frozenCore->GetHealth()); // sync health on phase change
                                frozenCore->DespawnOrUnsummon(0);
                            }
                            break;
                        case EVENT_COLD_SLAP:
                            if (Unit* target = SelectTarget(SELECT_TARGET_NEAREST, 0, 8.0f, true))
                                DoCast(target, SPELL_COLD_SLAP);
                            events.ScheduleEvent(EVENT_COLD_SLAP, 1000, 0, PHASE_ONE);
                            break;
                        case EVENT_ICE_SPIKE:
                            DoCastVictim(SPELL_ICE_SPIKE);
                            events.ScheduleEvent(EVENT_ICE_SPIKE, 5000, 0, PHASE_ONE);
                            break;
                        case EVENT_SUMMON_HAILSTONE:
                            me->SummonCreature(NPC_AHUNITE_HAILSTONE, SummonPositions[1], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3000);
                            break;
                        case EVENT_SUMMON_COLDWEAVE: // they always come in pairs of two
                            me->CastSpell(SummonPositions[2].GetPositionX(), SummonPositions[2].GetPositionY(), SummonPositions[2].GetPositionZ(), SPELL_SUMMON_MINION_VISUAL, false);
                            me->SummonCreature(NPC_AHUNITE_COLDWEAVE, SummonPositions[2], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3000);
                            me->CastSpell(SummonPositions[3].GetPositionX(), SummonPositions[3].GetPositionY(), SummonPositions[3].GetPositionZ(), SPELL_SUMMON_MINION_VISUAL, false);
                            me->SummonCreature(NPC_AHUNITE_COLDWEAVE, SummonPositions[3], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3000);
                            events.ScheduleEvent(EVENT_SUMMON_COLDWEAVE, 5000, 0, PHASE_ONE);
                            break;
                        case EVENT_SUMMON_FROSTWIND: // not in first phase 1
                            me->SummonCreature(NPC_AHUNITE_FROSTWIND, SummonPositions[urand(2,3)], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3000);
                            events.ScheduleEvent(EVENT_SUMMON_FROSTWIND, 7000, 0, PHASE_ONE);
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }
        };
};

class npc_ahunite_hailstone : public CreatureScript
{
    public:
        npc_ahunite_hailstone() : CreatureScript("npc_ahunite_hailstone") { }

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_ahunite_hailstoneAI(creature);
        }

        struct npc_ahunite_hailstoneAI : public ScriptedAI
        {
            npc_ahunite_hailstoneAI(Creature* creature) : ScriptedAI(creature) { }

            EventMap events;

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_PULVERIZE, urand(6000, 8000));

                DoCast(me, SPELL_CHILLING_AURA);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_PULVERIZE:
                            DoCastVictim(SPELL_PULVERIZE);
                            events.ScheduleEvent(EVENT_PULVERIZE, urand(6000, 8000));
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }
        };
};

class npc_ahunite_coldweave : public CreatureScript
{
    public:
        npc_ahunite_coldweave() : CreatureScript("npc_ahunite_coldweave") { }

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_ahunite_coldweaveAI(creature);
        }

        struct npc_ahunite_coldweaveAI : public ScriptedAI
        {
            npc_ahunite_coldweaveAI(Creature* creature) : ScriptedAI(creature) { }

            EventMap events;

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_BITTER_BLAST, 500);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_BITTER_BLAST:
                            DoCastVictim(SPELL_BITTER_BLAST);
                            events.ScheduleEvent(EVENT_BITTER_BLAST, urand(5000, 7000));
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }
        };
};

class npc_ahunite_frostwind : public CreatureScript
{
    public:
        npc_ahunite_frostwind() : CreatureScript("npc_ahunite_frostwind") { }

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_ahunite_frostwindAI(creature);
        }

        struct npc_ahunite_frostwindAI : public ScriptedAI
        {
            npc_ahunite_frostwindAI(Creature* creature) : ScriptedAI(creature) { }

            EventMap events;

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_WIND_BUFFET, 3000); // TODO: get correct timing for wind buffet

                DoCast(me, SPELL_LIGHTNING_SHIELD);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_WIND_BUFFET:
                            if (Unit* target = SelectTarget(SELECT_TARGET_FARTHEST, 0, 120.0f))
                                DoCast(target, SPELL_WIND_BUFFET);
                            events.ScheduleEvent(EVENT_WIND_BUFFET, urand(5000, 10000));
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }
        };
};

void AddSC_boss_ahune()
{
    new boss_ahune();
    new npc_ahunite_hailstone();
    new npc_ahunite_coldweave();
    new npc_ahunite_frostwind();
}