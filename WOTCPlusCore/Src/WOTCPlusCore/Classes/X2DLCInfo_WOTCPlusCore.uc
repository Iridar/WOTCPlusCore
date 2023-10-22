class X2DLCInfo_WOTCPlusCore extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated()
{
	PatchSkulljack();
}

static private function PatchSkulljack()
{
	local X2AbilityTemplateManager	AbilityMgr;
	local X2AbilityTemplate			Template;
	local X2AbilityCharges			Charges;

	AbilityMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	Template = AbilityMgr.FindAbilityTemplate('SKULLJACKAbility');
	Template.AbilityToHitCalc = new class'X2AbilityToHitCalc_StasisLanceMod';

	Template = AbilityMgr.FindAbilityTemplate('SKULLMINEAbility');
	Template.AbilityToHitCalc = new class'X2AbilityToHitCalc_StasisLanceMod';

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = `GetConfigInt("IRI_WP_Skullmine_Charges");
	Template.AbilityCharges = Charges;

	// TODO: Figure out nonsenical action costs and maybe cancelling.
	// TODO: Add raise zombie hack rewards
}

