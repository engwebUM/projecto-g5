function validateForm(el){
  el.validate({
    rules: {
      "participant[name]": {required: true},
      "participant[email]": {required: true, email: true},
      "participant[twitter]": {url: true},
      "participant[github]": {url: true}
    }
  });
}
