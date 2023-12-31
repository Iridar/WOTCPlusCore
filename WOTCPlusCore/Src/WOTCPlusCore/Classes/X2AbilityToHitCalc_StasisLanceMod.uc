class X2AbilityToHitCalc_StasisLanceMod extends X2AbilityToHitCalc_StandardMelee;

var private config int HP_THRESHOLD;
var private config int AIM_MOD_PER_HP_ABOVE_THRESHOLD;
var private config int AIM_MOD_PER_HP_BELOW_THRESHOLD;

function GetAdditionalHitModifiers_CH(XComGameState_Ability kAbility, AvailableTarget kTarget, optional out ShotBreakdown m_ShotBreakdown, optional bool bDebugLog = false)
{
	local XComGameState_Unit TargetUnit;
	local int TargetHP;
	local int Modifier;

	TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(kTarget.PrimaryTarget.ObjectID));

	if (TargetUnit != none)
	{
		TargetHP = TargetUnit.GetCurrentStat(eStat_HP);
		if (TargetHP < HP_THRESHOLD)
		{
			Modifier = (HP_THRESHOLD - TargetHP) * AIM_MOD_PER_HP_BELOW_THRESHOLD;
		}
		else
		{
			Modifier = (TargetHP - HP_THRESHOLD) * AIM_MOD_PER_HP_ABOVE_THRESHOLD;
		}

		AddModifier(Modifier, class'XLocalizedData'.default.HealthLabel, m_ShotBreakdown, eHit_Success, bDebugLog);
	}
}

DefaultProperties
{
	bAllowCrit = false
}
