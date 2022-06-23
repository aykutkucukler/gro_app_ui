class Validators {
  static String? validateEmpty(String? value) {
    if (value?.isEmpty == true) {
      return 'Alan boş olamaz!';
    }

    return null;
  }

  static String? validateUserName(String? value) {
    if (value?.isEmpty == true) {
      return 'Kullanıcı adı boş olamaz!';
    }

    if ((value?.length ?? 0) < 6 || (value?.length ?? 0) > 20) {
      return 'Kullanıcı adı karakter uzunluğu 6-20 arasında olmalı!';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value?.isEmpty == true || (value?.length??0) < 6) {
      return 'Şifre boş olamaz!';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    var regex = RegExp(pattern as String);

    if (value?.isEmpty == true) {
      return 'E-posta boş olamaz!';
    }

    if (!regex.hasMatch(value ?? '')) {
      return 'Geçerli e-posta giriniz!';
    } else {
      return null;
    }
  }
}
