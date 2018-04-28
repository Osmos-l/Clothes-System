--[[
Addon by Osmos[FR] : https://steamcommunity.com/id/ThePsyca/
Info : Public Addon
Version : Beta
]]--

cclothes = cclothes or {}

cclothes.addvet = {}

cclothes.lang = {}

cclothes.oncursor = "buttons/lightswitch2.wav"

cclothes.onclick = "buttons/button14.wav"

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

cclothes.teamrestrict = {
	
	["Cops"] = true,
	["Police"] = true,
}

--[[

[EN] Here you can choose for them jobs is restrict the seller, here is an example:

["NAME OF JOBS"] = true,

/!\ If the job has capital letters, it must be done /!\

[FR] Ici tu peux choisir pour qu'elles jobs est restrict le vendeur, voici un exemple :

["NOM DU JOBS"] = true,

/!\ Si le travail a des lettres majuscules, il doit être fait /!\

]]--

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

cclothes.models = "models/humans/group01/male_02.mdl"

--[[

[EN] Here you can choice the model of the npc shop

[FR] Ici tu peux choisir le model du npc vendeur 

]]--

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

cclothes.lang.chooselang = "FR"

--[[

[EN] You can choose between two languages already pre-configure "FR" or "EN", for all the modifications of the sentences you have to go in nlf_clangue.lua

[FR] Vous pouvez choisir entre deux languages déjà pré-configurer "FR" ou "EN", pour toutes modifications des phrases il vous faut allez dans nlf_clangue.lua	

]]--

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

cclothes.samemodelonspawn = true 

--[[ 

[EN]Player spawn all time with the last model buy / equip 

[FR]Le joueur spawn tout le temps avec le dernier model qu'il à acheté / équipé

]]--

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

cclothes.initspawnoldmodel = true

--[[ 

[EN]the player on the first spawn, he appears with the same models as when he disconnected or not ?

If it's true, it appears with the same model as when it disconnected.
If false then he spawn with the model of the job

[FR]Le joueur lors du premier spawn, il spawn avec le model qu'il avait lors de sa dernière connection ou non ?

Si true alors il apparait avec le même model
Si false alors il apparait avec le model du job

]]--

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--[[
Configuration :

[EN]cclothes.addvet[lastid + 1 ] = {prix = PRICE, models = "YOUR MODELS", name = "The NAME IN STORE", type = "male or female"}
/!\ do not forget to change the id /!\

[FR]cclothes.addvet[dernierid + 1] = {prix = PRIX, models = "LE MODELS", name = "LE NOM DANS LE SHOP", type = "male ou female"}
/!\ N'oublie pas de changer l'id ! /!\

]]--


cclothes.addvet[1] = {prix = 500, models = "models/humans/group02/male_06.mdl", name = "male_06", type = "male"}

cclothes.addvet[2] = {prix = 500, models = "models/player/alyx.mdl", name = "Alyx", type = "female"}

cclothes.addvet[3] = {prix = 500, models = "models/player/barney.mdl", name = "Barney", type = "male"}

cclothes.addvet[4] = {prix = 500, models = "models/player/breen.mdl", name = "Breen", type = "male"}

cclothes.addvet[5] = {prix = 500, models = "models/player/p2_chell.mdl", name = "p2_chell", type = "female"}

cclothes.addvet[6] = {prix = 500, models = "models/player/eli.mdl", name = "eli", type = "male"}

cclothes.addvet[7] = {prix = 500, models = "models/player/gman_high.mdl", name = "gman_high", type = "male"}

cclothes.addvet[8] = {prix = 500, models = "models/player/kleiner.mdl", name = "kleiner", type = "male"}

cclothes.addvet[9] = {prix = 500, models = "models/player/monk.mdl", name = "monk", type = "male"}

cclothes.addvet[10] = {prix = 500, models = "models/player/mossman.mdl", name = "mossman", type = "female"}

cclothes.addvet[11] = {prix = 500, models = "models/player/odessa.mdl", name = "odessa", type = "male"}

cclothes.addvet[12] = {prix = 500, models = "models/player/magnusson.mdl", name = "magnusson", type = "male"}

cclothes.addvet[13] = {prix = 500, models = "models/player/Group01/female_01.mdl", name = "G1 female_01", type = "female"}

cclothes.addvet[14] = {prix = 500, models = "models/player/Group01/female_02.mdl", name = "G1 female_02", type = "female"}

cclothes.addvet[15] = {prix = 500, models = "models/player/Group01/female_03.mdl", name = "G1 female_03", type = "female"}

cclothes.addvet[16] = {prix = 500, models = "models/player/Group01/female_04.mdl", name = "G1 female_04", type = "female"}

cclothes.addvet[17] = {prix = 500, models = "models/player/Group01/female_05.mdl", name = "G1 female_05", type = "female"}

cclothes.addvet[18] = {prix = 500, models = "models/player/Group01/female_06.mdl", name = "G1 female_06", type = "female"}

cclothes.addvet[19] = {prix = 500, models = "models/player/Group03/female_01.mdl", name = "G2 female_01", type = "female"}

cclothes.addvet[20] = {prix = 500, models = "models/player/Group03/female_02.mdl", name = "G2 female_02", type = "female"} 

cclothes.addvet[21] = {prix = 500, models = "models/player/Group03/female_03.mdl", name = "G2 female_03", type = "female"}

cclothes.addvet[22] = {prix = 500, models = "models/player/Group03/female_04.mdl", name = "G2 female_04", type = "female"}

cclothes.addvet[23] = {prix = 500, models = "models/player/Group03/female_05.mdl", name = "G2 female_05", type = "female"}

cclothes.addvet[24] = {prix = 500, models = "models/player/Group03/female_06.mdl", name = "G2 female_06", type = "female"}

cclothes.addvet[25] = {prix = 500, models = "models/player/Group03m/female_01.mdl", name = "G3 female_01", type = "female"}

cclothes.addvet[26] = {prix = 500, models = "models/player/Group03m/female_02.mdl", name = "G3 female_02", type = "female"}

cclothes.addvet[27] = {prix = 500, models = "models/player/Group03m/female_03.mdl", name = "G3 female_03", type = "female"}

cclothes.addvet[28] = {prix = 500, models = "models/player/Group03m/female_04.mdl", name = "G3 female_04", type = "female"}

cclothes.addvet[29] = {prix = 500, models = "models/player/Group03m/female_05.mdl", name = "G3 female_05", type = "female"}

cclothes.addvet[30] = {prix = 500, models = "models/player/Group03m/female_06.mdl", name = "G3 female_06", type = "female"}

cclothes.addvet[31] = {prix = 500, models = "models/player/Group01/male_01.mdl", name = "G1 male_01", type = "male"}

cclothes.addvet[32] = {prix = 500, models = "models/player/Group01/male_02.mdl", name = "G1 male_02", type = "male"} 

cclothes.addvet[33] = {prix = 500, models = "models/player/Group01/male_03.mdl", name = "G1 male_03", type = "male"}

cclothes.addvet[34] = {prix = 500, models = "models/player/Group01/male_04.mdl", name = "G1 male_04", type = "male"}

cclothes.addvet[35] = {prix = 500, models = "models/player/Group01/male_05.mdl", name = "G1 male_05", type = "male"}

cclothes.addvet[36] = {prix = 500, models = "models/player/Group01/male_06.mdl", name = "G1 male_06", type = "male"}

--[[
Addon by Osmos[FR] : https://steamcommunity.com/id/ThePsyca/
Info : Public Addon
Version : Beta
]]--