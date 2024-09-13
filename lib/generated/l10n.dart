// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocale {
  AppLocale();

  static AppLocale? _current;

  static AppLocale get current {
    assert(_current != null,
        'No instance of AppLocale was loaded. Try to initialize the AppLocale delegate before accessing AppLocale.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocale> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocale();
      AppLocale._current = instance;

      return instance;
    });
  }

  static AppLocale of(BuildContext context) {
    final instance = AppLocale.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocale present in the widget tree. Did you add AppLocale.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocale? maybeOf(BuildContext context) {
    return Localizations.of<AppLocale>(context, AppLocale);
  }

  /// `Tìm kiếm`
  String get common_search {
    return Intl.message(
      'Tìm kiếm',
      name: 'common_search',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo`
  String get common_notification {
    return Intl.message(
      'Thông báo',
      name: 'common_notification',
      desc: '',
      args: [],
    );
  }

  /// `Bộ sưu tập`
  String get common_collection {
    return Intl.message(
      'Bộ sưu tập',
      name: 'common_collection',
      desc: '',
      args: [],
    );
  }

  /// `Trang chủ`
  String get common_home {
    return Intl.message(
      'Trang chủ',
      name: 'common_home',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản`
  String get common_profile {
    return Intl.message(
      'Tài khoản',
      name: 'common_profile',
      desc: '',
      args: [],
    );
  }

  /// `Thứ Hai`
  String get common_monday {
    return Intl.message(
      'Thứ Hai',
      name: 'common_monday',
      desc: '',
      args: [],
    );
  }

  /// `Thứ Ba`
  String get common_tuesday {
    return Intl.message(
      'Thứ Ba',
      name: 'common_tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Thứ Tư`
  String get common_wednesday {
    return Intl.message(
      'Thứ Tư',
      name: 'common_wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thứ Năm`
  String get common_thursday {
    return Intl.message(
      'Thứ Năm',
      name: 'common_thursday',
      desc: '',
      args: [],
    );
  }

  /// `Thứ Sáu`
  String get common_friday {
    return Intl.message(
      'Thứ Sáu',
      name: 'common_friday',
      desc: '',
      args: [],
    );
  }

  /// `Thứ Bảy`
  String get common_saturday {
    return Intl.message(
      'Thứ Bảy',
      name: 'common_saturday',
      desc: '',
      args: [],
    );
  }

  /// `Chủ Nhật`
  String get common_sunday {
    return Intl.message(
      'Chủ Nhật',
      name: 'common_sunday',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get common_email {
    return Intl.message(
      'Email',
      name: 'common_email',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get common_phone_number {
    return Intl.message(
      'Số điện thoại',
      name: 'common_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get common_password {
    return Intl.message(
      'Mật khẩu',
      name: 'common_password',
      desc: '',
      args: [],
    );
  }

  /// `Họ và tên`
  String get common_first_name_last_name {
    return Intl.message(
      'Họ và tên',
      name: 'common_first_name_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Tên`
  String get common_name {
    return Intl.message(
      'Tên',
      name: 'common_name',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get common_username {
    return Intl.message(
      'Username',
      name: 'common_username',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số điện thoại mới`
  String get validator_please_input_new_phone_number {
    return Intl.message(
      'Nhập số điện thoại mới',
      name: 'validator_please_input_new_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại phải có ít nhất 10 chữ số`
  String get validator_phone_at_least_10_digits {
    return Intl.message(
      'Số điện thoại phải có ít nhất 10 chữ số',
      name: 'validator_phone_at_least_10_digits',
      desc: '',
      args: [],
    );
  }

  /// `{value} không đúng định dạng`
  String validator_value_not_correct_format(Object value) {
    return Intl.message(
      '$value không đúng định dạng',
      name: 'validator_value_not_correct_format',
      desc: '',
      args: [value],
    );
  }

  /// `Nhập số điện thoại`
  String get validator_please_input_phone_number {
    return Intl.message(
      'Nhập số điện thoại',
      name: 'validator_please_input_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `{value} không hợp lệ`
  String validator_value_is_not_invalid(Object value) {
    return Intl.message(
      '$value không hợp lệ',
      name: 'validator_value_is_not_invalid',
      desc: '',
      args: [value],
    );
  }

  /// `Vui lòng điền {value}`
  String validator_please_input_value(Object value) {
    return Intl.message(
      'Vui lòng điền $value',
      name: 'validator_please_input_value',
      desc: '',
      args: [value],
    );
  }

  /// `Nhập {value} của bạn`
  String common_validate_empty_value(Object value) {
    return Intl.message(
      'Nhập $value của bạn',
      name: 'common_validate_empty_value',
      desc: '',
      args: [value],
    );
  }

  /// `Cập nhật username`
  String get validator_please_input_username {
    return Intl.message(
      'Cập nhật username',
      name: 'validator_please_input_username',
      desc: '',
      args: [],
    );
  }

  /// `Cho phép`
  String get common_allow {
    return Intl.message(
      'Cho phép',
      name: 'common_allow',
      desc: '',
      args: [],
    );
  }

  /// `Không cho phép`
  String get common_un_allow {
    return Intl.message(
      'Không cho phép',
      name: 'common_un_allow',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get common_camera {
    return Intl.message(
      'Camera',
      name: 'common_camera',
      desc: '',
      args: [],
    );
  }

  /// `Thư viện`
  String get common_gallery {
    return Intl.message(
      'Thư viện',
      name: 'common_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Cho phép truy cập hình ảnh và nội dung nghe nhìn trên thiết bị để tải hình ảnh lên đánh giá của bạn`
  String get permission_photos_message {
    return Intl.message(
      'Cho phép truy cập hình ảnh và nội dung nghe nhìn trên thiết bị để tải hình ảnh lên đánh giá của bạn',
      name: 'permission_photos_message',
      desc: '',
      args: [],
    );
  }

  /// `Face App`
  String get app_name {
    return Intl.message(
      'Face App',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `<p>Các bước để cho phép truy cập hình ảnh<br>\n   1. Vào thông tin ứng dụng <b>Face AI</b><br>\n   2. Chọn <b>Quyền</b> > Chọn <b>Bộ nhớ</b><br>\n   3. Chọn <b>Chỉ cho phép truy cập vào nội dung nghe nhìn</b></p>`
  String get permission_photos_steps_android {
    return Intl.message(
      '<p>Các bước để cho phép truy cập hình ảnh<br>\n   1. Vào thông tin ứng dụng <b>Face AI</b><br>\n   2. Chọn <b>Quyền</b> > Chọn <b>Bộ nhớ</b><br>\n   3. Chọn <b>Chỉ cho phép truy cập vào nội dung nghe nhìn</b></p>',
      name: 'permission_photos_steps_android',
      desc: '',
      args: [],
    );
  }

  /// `<p>Các bước để cho phép truy cập hình ảnh<br>\n   1. Vào thông tin ứng dụng <b>Face AI</b><br>\n   2. Chọn <b>Ảnh</b><br>\n   3. Chọn <b>Ảnh được chọn</b> hoặc <b>Tất cả ảnh</b></p>`
  String get permission_photos_steps_ios {
    return Intl.message(
      '<p>Các bước để cho phép truy cập hình ảnh<br>\n   1. Vào thông tin ứng dụng <b>Face AI</b><br>\n   2. Chọn <b>Ảnh</b><br>\n   3. Chọn <b>Ảnh được chọn</b> hoặc <b>Tất cả ảnh</b></p>',
      name: 'permission_photos_steps_ios',
      desc: '',
      args: [],
    );
  }

  /// `Cho phép truy cập chụp ảnh và quay video để chụp hình ảnh cho đánh giá của bạn`
  String get permission_camera_message {
    return Intl.message(
      'Cho phép truy cập chụp ảnh và quay video để chụp hình ảnh cho đánh giá của bạn',
      name: 'permission_camera_message',
      desc: '',
      args: [],
    );
  }

  /// `<p>Các bước để cho phép truy cập máy ảnh<br>\n   1. Vào thông tin ứng dụng <b>Face AI</b><br>\n   2. Chọn <b>Quyền</b> > Chọn <b>Máy ảnh</b><br>\n   3. Chọn <b>Chỉ cho phép khi dùng dứng dụng</b> hoặc <b>Luôn hỏi</b></p>`
  String get permission_camera_steps_android {
    return Intl.message(
      '<p>Các bước để cho phép truy cập máy ảnh<br>\n   1. Vào thông tin ứng dụng <b>Face AI</b><br>\n   2. Chọn <b>Quyền</b> > Chọn <b>Máy ảnh</b><br>\n   3. Chọn <b>Chỉ cho phép khi dùng dứng dụng</b> hoặc <b>Luôn hỏi</b></p>',
      name: 'permission_camera_steps_android',
      desc: '',
      args: [],
    );
  }

  /// `<p>Các bước để cho phép truy cập máy ảnh<br>\n   1. Vào thông tin ứng dụng <b>Face AI</b><br>\n   2. Bật quyền <b>Camera</b><br>`
  String get permission_camera_steps_ios {
    return Intl.message(
      '<p>Các bước để cho phép truy cập máy ảnh<br>\n   1. Vào thông tin ứng dụng <b>Face AI</b><br>\n   2. Bật quyền <b>Camera</b><br>',
      name: 'permission_camera_steps_ios',
      desc: '',
      args: [],
    );
  }

  /// `Face App`
  String get enhance_topbar_title {
    return Intl.message(
      'Face App',
      name: 'enhance_topbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Làm đẹp`
  String get enhance_title {
    return Intl.message(
      'Làm đẹp',
      name: 'enhance_title',
      desc: '',
      args: [],
    );
  }

  /// `Bằng văn bản`
  String get text_style {
    return Intl.message(
      'Bằng văn bản',
      name: 'text_style',
      desc: '',
      args: [],
    );
  }

  /// `Tạo`
  String get face_ai_generate {
    return Intl.message(
      'Tạo',
      name: 'face_ai_generate',
      desc: '',
      args: [],
    );
  }

  /// `Tìm kiếm phổ biến`
  String get face_ai_popular_searches {
    return Intl.message(
      'Tìm kiếm phổ biến',
      name: 'face_ai_popular_searches',
      desc: '',
      args: [],
    );
  }

  /// `Hình ảnh`
  String get face_ai_person {
    return Intl.message(
      'Hình ảnh',
      name: 'face_ai_person',
      desc: '',
      args: [],
    );
  }

  /// `Cho phép truy cập`
  String get allow_access {
    return Intl.message(
      'Cho phép truy cập',
      name: 'allow_access',
      desc: '',
      args: [],
    );
  }

  /// `Bộ sưu tập của bạn`
  String get to_your_photos {
    return Intl.message(
      'Bộ sưu tập của bạn',
      name: 'to_your_photos',
      desc: '',
      args: [],
    );
  }

  /// `Ảnh sẽ xuất hiện ở đây`
  String get they_will_appear_here {
    return Intl.message(
      'Ảnh sẽ xuất hiện ở đây',
      name: 'they_will_appear_here',
      desc: '',
      args: [],
    );
  }

  /// `Kết quả AI`
  String get ai_gen_result {
    return Intl.message(
      'Kết quả AI',
      name: 'ai_gen_result',
      desc: '',
      args: [],
    );
  }

  /// `Xin hãy đợi một chút...`
  String get loading {
    return Intl.message(
      'Xin hãy đợi một chút...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Tạo lại`
  String get regenerate_image {
    return Intl.message(
      'Tạo lại',
      name: 'regenerate_image',
      desc: '',
      args: [],
    );
  }

  /// `Tải xuống`
  String get download_image {
    return Intl.message(
      'Tải xuống',
      name: 'download_image',
      desc: '',
      args: [],
    );
  }

  /// `Chia sẻ`
  String get share {
    return Intl.message(
      'Chia sẻ',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Thêm mô tả`
  String get additional_prompt {
    return Intl.message(
      'Thêm mô tả',
      name: 'additional_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Bằng ảnh`
  String get photo_style {
    return Intl.message(
      'Bằng ảnh',
      name: 'photo_style',
      desc: '',
      args: [],
    );
  }

  /// `Kiểu siêu thực`
  String get super_style {
    return Intl.message(
      'Kiểu siêu thực',
      name: 'super_style',
      desc: '',
      args: [],
    );
  }

  /// `Kiểu thực tế`
  String get real_style {
    return Intl.message(
      'Kiểu thực tế',
      name: 'real_style',
      desc: '',
      args: [],
    );
  }

  /// `Đổi khuôn mặt`
  String get photo_swap {
    return Intl.message(
      'Đổi khuôn mặt',
      name: 'photo_swap',
      desc: '',
      args: [],
    );
  }

  /// `Làm đẹp siêu thực`
  String get super_enhance {
    return Intl.message(
      'Làm đẹp siêu thực',
      name: 'super_enhance',
      desc: '',
      args: [],
    );
  }

  /// `Làm đẹp`
  String get normal_enhance {
    return Intl.message(
      'Làm đẹp',
      name: 'normal_enhance',
      desc: '',
      args: [],
    );
  }

  /// `QR này đã hết thời hạn`
  String get QR_expired_message {
    return Intl.message(
      'QR này đã hết thời hạn',
      name: 'QR_expired_message',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán thành công`
  String get QR_success_message {
    return Intl.message(
      'Thanh toán thành công',
      name: 'QR_success_message',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán QR`
  String get QR_code_payment {
    return Intl.message(
      'Thanh toán QR',
      name: 'QR_code_payment',
      desc: '',
      args: [],
    );
  }

  /// `Giá cả`
  String get pricing {
    return Intl.message(
      'Giá cả',
      name: 'pricing',
      desc: '',
      args: [],
    );
  }

  /// `Số tiền thanh toán`
  String get payment_amount {
    return Intl.message(
      'Số tiền thanh toán',
      name: 'payment_amount',
      desc: '',
      args: [],
    );
  }

  /// `Số click còn lại`
  String get clicks_remained {
    return Intl.message(
      'Số click còn lại',
      name: 'clicks_remained',
      desc: '',
      args: [],
    );
  }

  /// `Ảnh của bạn không có khuôn mặt. Một số chức năng có thể sẽ không hoạt động`
  String get no_face_warning {
    return Intl.message(
      'Ảnh của bạn không có khuôn mặt. Một số chức năng có thể sẽ không hoạt động',
      name: 'no_face_warning',
      desc: '',
      args: [],
    );
  }

  /// `Chỉnh sửa`
  String get editor {
    return Intl.message(
      'Chỉnh sửa',
      name: 'editor',
      desc: '',
      args: [],
    );
  }

  /// `Xóa nền`
  String get remove_background {
    return Intl.message(
      'Xóa nền',
      name: 'remove_background',
      desc: '',
      args: [],
    );
  }

  /// `Đã có lỗi xảy ra. Hãy thử lại sau ít phút`
  String get error_msg {
    return Intl.message(
      'Đã có lỗi xảy ra. Hãy thử lại sau ít phút',
      name: 'error_msg',
      desc: '',
      args: [],
    );
  }

  /// `Server đang quá tải. Hãy thử lại sau ít phút.`
  String get overloaded_error {
    return Intl.message(
      'Server đang quá tải. Hãy thử lại sau ít phút.',
      name: 'overloaded_error',
      desc: '',
      args: [],
    );
  }

  /// `Bạn chưa nhập mô tả của mình.`
  String get no_prompt_error {
    return Intl.message(
      'Bạn chưa nhập mô tả của mình.',
      name: 'no_prompt_error',
      desc: '',
      args: [],
    );
  }

  /// `Chức năng này yêu cầu ảnh của bạn phải có khuôn mặt. Xin hãy chọn lại.`
  String get no_face_force_warning {
    return Intl.message(
      'Chức năng này yêu cầu ảnh của bạn phải có khuôn mặt. Xin hãy chọn lại.',
      name: 'no_face_force_warning',
      desc: '',
      args: [],
    );
  }

  /// `Tất cả`
  String get all {
    return Intl.message(
      'Tất cả',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Khuôn mặt`
  String get faces {
    return Intl.message(
      'Khuôn mặt',
      name: 'faces',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đã hết lượt click. Xin hãy mua thêm để tiếp tục.`
  String get out_of_clicks_warning {
    return Intl.message(
      'Bạn đã hết lượt click. Xin hãy mua thêm để tiếp tục.',
      name: 'out_of_clicks_warning',
      desc: '',
      args: [],
    );
  }

  /// `Thành công`
  String get successfully {
    return Intl.message(
      'Thành công',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi`
  String get error {
    return Intl.message(
      'Lỗi',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Bình thường`
  String get normal {
    return Intl.message(
      'Bình thường',
      name: 'normal',
      desc: '',
      args: [],
    );
  }

  /// `Cảnh báo`
  String get warning {
    return Intl.message(
      'Cảnh báo',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Trang điểm`
  String get make_up {
    return Intl.message(
      'Trang điểm',
      name: 'make_up',
      desc: '',
      args: [],
    );
  }

  /// `Bút ma thuật`
  String get magic_brush {
    return Intl.message(
      'Magic Brush',
      name: 'magic_brush',
      desc: '',
      args: [],
    );
  }

  /// `Làm mờ nền`
  String get blur_background {
    return Intl.message(
      'Blur Background',
      name: 'blur_background',
      desc: '',
      args: [],
    );
  }
  // skipped getter for the '' key
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocale> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'cn'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocale> load(Locale locale) => AppLocale.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
