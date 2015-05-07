function validateForm(el){
  el.validate({
    rules: {
      "user[email]": {required: true, email: true},
      "user[password]": {required: true, minlength: 8},
      "user[password_confirmation]": {required: true, equalTo: "#user_password"}
    }
  });
}