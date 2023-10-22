class X2DLCInfo_WOTCPlusCore extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated()
{
	PatchSkulljack();
}

static private function PatchSkulljack()
{
	local X2AbilityTemplateManager	AbilityMgr;
	local X2AbilityTemplate			Template;

	AbilityMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityMgr.FindAbilityTemplate('SKULLJACKAbility');
	Template.AbilityToHitCalc = new class'X2AbilityToHitCalc_StasisLanceMod';

	Template = AbilityMgr.FindAbilityTemplate('SKULLMINEAbility');
	Template.AbilityToHitCalc = new class'X2AbilityToHitCalc_StasisLanceMod';

	Template.AbilityCharges = none;
	class'Help'.static.RemoveChargeCost(Template);
}

