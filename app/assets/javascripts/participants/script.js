function setPlanIdForParticipant(inputPlanValueId, dataPlanId){
	var planId = $("[" + dataPlanId + "]").attr(dataPlanId);
	$(inputPlanValueId).val(planId);
}