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
        $("<div>" + data[0].message + "</div>").insertBefore("#form-credentials")
          .delay(3000)
          .fadeOut(function() {
             $(this).remove(); 
          });
      }
    });
  }

  function update_field(el) {
    el.className = "btn btn-default";
    el.text = "Yes";
  }