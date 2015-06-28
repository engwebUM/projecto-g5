function setPlanIdForParticipant(inputPlanValueId, dataPlanId){
	var planId = $("[" + dataPlanId + "]").attr(dataPlanId);
	$(inputPlanValueId).val(planId);
}

function selectall(el) {
    if(el.checked) {
      $('input[type="checkbox"]').each(function() {
          this.checked = true;          
      });
    }else{
      $('input[type="checkbox"]').each(function() {
          this.checked = false;                       
      });         
    }
  }

  function generateCredentials() {
    var form = $("#form-credentials");
    $.ajax({
      type: "GET",
      url: "/admin/participants/generate_credentials",
      dataType: "json",
      traditional: true,
      data: form.serialize(),
      success: function(data){
        $("<div class='alert alert-success'>" + data[0].message + "</div>").insertBefore(".container")
          .delay(5000)
          .fadeOut(function() {
             $(this).remove(); 
          });
        $("#save-credentials").removeAttr('disabled');
      }
    });
  }

  function update_field(el) {
    el.className = "btn btn-default";
    el.text = "Yes";
  }