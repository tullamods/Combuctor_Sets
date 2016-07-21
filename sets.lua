--[[
	sets.lua
		Basic set types for combuctor
--]]

local CombuctorSet = Combuctor:GetModule('Sets')
local L = LibStub('AceLocale-3.0'):GetLocale('Combuctor')

CombuctorSet:RegisterSubSet(ALL, ALL)
CombuctorSet:RegisterSubSet(L.Normal, ALL, nil, function(player, bagType) return bagType == 0 end)
CombuctorSet:RegisterSubSet(L.Trade, ALL, nil, function(player, bagType) return bagType ~= 0 end)


-- Equipment
local function isEquipment(player, bagType, name, link, quality, level, ilvl, type)
	return (type == L.Armor or type == L.Weapon)
end

local function isArmor(player, bagType, name, link, quality, level, ilvl, type, subType, stackCount, equipLoc)
	return type == L.Armor and equipLoc ~= 'INVTYPE_TRINKET'
end

local function isWeapon(player, bagType, name, link, quality, level, ilvl, type)
	return type == L.Weapon
end

local function isTrinket(player, bagType, name, link, quality, level, ilvl, type, subType, stackCount, equipLoc)
	return equipLoc == 'INVTYPE_TRINKET'
end

CombuctorSet:Register(L.Equipment, 'Interface/Icons/INV_Chest_Chain_04', isEquipment)
CombuctorSet:RegisterSubSet(ALL, L.Equipment)
CombuctorSet:RegisterSubSet(L.Armor, L.Equipment, nil, isArmor)
CombuctorSet:RegisterSubSet(L.Weapon, L.Equipment, nil, isWeapon)
CombuctorSet:RegisterSubSet(L.Trinket, L.Equipment, nil, isTrinket)


-- Usables
local function isUsable(player, bagType, name, link, quality, level, ilvl, type, subType)
	return type == L.Consumable
end

local function isConsumable(player, bagType, name, link, quality, level, ilvl, type)
	return type == L.Consumable
end

local function isDevice(player, bagType, name, link, quality, level, ilvl, type)
	return type == L.TradeGood
end

local function isQuestItem(player, bagType, name, link, quality, level, ilvl, type)
	return type == L.Quest
end

CombuctorSet:Register(L.Usable, 'Interface/Icons/INV_Potion_93', isUsable)
CombuctorSet:RegisterSubSet(ALL, L.Usable)
CombuctorSet:RegisterSubSet(L.Consumable, L.Usable, nil, isConsumable)


-- Questing
CombuctorSet:Register(L.Quest, 'Interface/QuestFrame/UI-QuestLog-BookIcon', isQuestItem)
CombuctorSet:RegisterSubSet(ALL, L.Quest)


-- Trade Goods
local function isGeneralTradeGood(player, bagType, name, link, quality, level, ilvl, type, subType)
	if type == L.TradeGood then
		return true
	end

	return type == L.Recipe or type == L.Gem
end

local function isTradeGood(player, bagType, name, link, quality, level, ilvl, type)
	return type == L.TradeGood
end

local function isGem(player, bagType, name, link, quality, level, ilvl, type)
	return type == L.Gem
end

local function isRecipe(player, bagType, name, link, quality, level, ilvl, type)
	return type == L.Recipe
end

CombuctorSet:Register(L.TradeGood, 'Interface/Icons/INV_Fabric_Silk_02', isGeneralTradeGood)
CombuctorSet:RegisterSubSet(ALL, L.TradeGood)
CombuctorSet:RegisterSubSet(L.TradeGood, L.TradeGood, nil, isTradeGood)
CombuctorSet:RegisterSubSet(L.Gem, L.TradeGood, nil, isGem)
CombuctorSet:RegisterSubSet(L.Recipe, L.TradeGood, nil, isRecipe)


-- Misc
local function isMiscItem(player, bagType, name, link, quality, level, ilvl, type)
	return type == L.Misc
end

CombuctorSet:Register(L.Misc, 'Interface/Icons/INV_Misc_Rune_01', isMiscItem)
CombuctorSet:RegisterSubSet(ALL, L.Misc)