// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "common": {
    "buttons": {
      "continue": "Continue",
      "start": "Begin!",
      "back": "Back",
      "next": "Further",
      "cancel": "Cancel",
      "save": "Save",
      "close": "Close",
      "add": "Add",
      "google": "Login with Google",
      "facebook": "Login with Facebook",
      "apple": "Sign in with Apple ID",
      "forgot_pass": "Forgot your password?",
      "login": "To come in",
      "already_have": "Already have an account?",
      "register": "Register"
    },
    "errors": {
      "required": "Obligatory field",
      "email": "Incorrect email",
      "password": "The password must contain at least 6 characters",
      "confirm_password": "Password mismatch",
      "email_exists": "A user with this email already exists",
      "password_email_incorrect": "Invalid email or password",
      "server": "server error",
      "unknown": "Unknown error",
      "not_found": "Not found"
    },
    "success": {
      "password_reset": "Password changed successfully",
      "password_reset_email": "An email with password recovery instructions has been sent to your email.",
      "add_success": "Successfully added",
      "update_success": "Updated successfully",
      "delete_success": "Successfully deleted"
    }
  },
  "auth": {
    "demo": {
      "title": {
        "first": "Do you love computer games and more?",
        "second": "Do you want to save your achievements and share them with friends?",
        "third": "Are you constantly looking for new games and want to stay up to date with all the events?"
      },
      "subtitle": {
        "first": "Our library will help you with this!",
        "second": "Our application allows you to save your achievements and share them with friends!",
        "third": "We provide you with the opportunity to keep abreast of all events in the world of games!"
      }
    },
    "login": {
      "title": "Authorization",
      "welocome_title": "Welcome to Game Keeper",
      "welocome_subtitle": "Login to your account",
      "email": "Email",
      "email_hint": "Enter your email",
      "password": "Password",
      "password_hint": "Enter your password",
      "button": "To come in",
      "login_with": "Login with",
      "forget_pass": "Forgot your password?",
      "login_or": "OR",
      "login_policy": "By logging in, you agree to the Game Keeper Terms of Service and Privacy Policy"
    }
  }
};
static const Map<String,dynamic> ru = {
  "common": {
    "buttons": {
      "continue": "Продолжить",
      "start": "Начать!",
      "back": "Назад",
      "next": "Далее",
      "cancel": "Отмена",
      "save": "Сохранить",
      "close": "Закрыть",
      "add": "Добавить",
      "google": "Войти через Google",
      "facebook": "Войти через Facebook",
      "apple": "Войти через Apple ID",
      "forgot_pass": "Забыли пароль?",
      "login": "Войти",
      "already_have": "Уже есть аккаунт?",
      "register": "Регистрация"
    },
    "errors": {
      "required": "Обязательное поле",
      "email": "Некорректный email",
      "password": "Пароль должен содержать не менее 6 символов",
      "confirm_password": "Пароли не совпадают",
      "email_exists": "Пользователь с таким email уже существует",
      "password_email_incorrect": "Неверный email или пароль",
      "server": "Ошибка сервера",
      "unknown": "Неизвестная ошибка",
      "not_found": "Не найдено"
    },
    "success": {
      "password_reset": "Пароль успешно изменен",
      "password_reset_email": "Письмо с инструкциями по восстановлению пароля отправлено на ваш email",
      "add_success": "Успешно добавлено",
      "update_success": "Успешно обновлено",
      "delete_success": "Успешно удалено"
    }
  },
  "auth": {
    "demo": {
      "title": {
        "first": "Вы любите компьютерные игры и не только?",
        "second": "Хотите сохранять свои достижения и делиться ими с друзьями?",
        "third": "Постоянно ищете новые игры и хотите быть в курсе всех событий?"
      },
      "subtitle": {
        "first": "Наша библиотека поможет вам в этом!",
        "second": "Наше приложение дает возможность вам сохранять свои достижения и делиться ими с друзьями!",
        "third": "Мы предоставляем вам возможность быть в курсе всех событий в мире игр!"
      }
    },
    "login": {
      "title": "Авторизация",
      "welocome_title": "Добро пожаловать в Game Keeper",
      "welocome_subtitle": "Войдите в свой аккаунт",
      "email": "Электронная почта",
      "email_hint": "Введите ваш email",
      "password": "Пароль",
      "password_hint": "Введите ваш пароль",
      "button": "Войти",
      "login_with": "Войти c помощью",
      "forget_pass": "Забыли пароль?",
      "login_or": "ИЛИ",
      "login_policy": "Выполняя вход, вы соглашаетесь с Условиями обслуживания Game Keeper и Политикой конфиденциальности."
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
