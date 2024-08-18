// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  static String m0(value) => "Nhập ${value} của bạn";

  static String m1(value) => "Vui lòng điền ${value}";

  static String m2(value) => "${value} không hợp lệ";

  static String m3(value) => "${value} không đúng định dạng";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "QR_code_payment":
            MessageLookupByLibrary.simpleMessage("Thanh toán QR"),
        "QR_expired_message":
            MessageLookupByLibrary.simpleMessage("QR này đã hết thời hạn"),
        "QR_success_message":
            MessageLookupByLibrary.simpleMessage("Thanh toán thành công"),
        "additional_prompt": MessageLookupByLibrary.simpleMessage("Thêm mô tả"),
        "ai_gen_result": MessageLookupByLibrary.simpleMessage("Kết quả AI"),
        "all": MessageLookupByLibrary.simpleMessage("Tất cả"),
        "allow_access":
            MessageLookupByLibrary.simpleMessage("Cho phép truy cập"),
        "app_name": MessageLookupByLibrary.simpleMessage("Face App"),
        "clicks_remained":
            MessageLookupByLibrary.simpleMessage("Số click còn lại"),
        "common_allow": MessageLookupByLibrary.simpleMessage("Cho phép"),
        "common_camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "common_collection": MessageLookupByLibrary.simpleMessage("Bộ sưu tập"),
        "common_email": MessageLookupByLibrary.simpleMessage("Email"),
        "common_first_name_last_name":
            MessageLookupByLibrary.simpleMessage("Họ và tên"),
        "common_friday": MessageLookupByLibrary.simpleMessage("Thứ Sáu"),
        "common_gallery": MessageLookupByLibrary.simpleMessage("Thư viện"),
        "common_home": MessageLookupByLibrary.simpleMessage("Trang chủ"),
        "common_monday": MessageLookupByLibrary.simpleMessage("Thứ Hai"),
        "common_name": MessageLookupByLibrary.simpleMessage("Tên"),
        "common_notification":
            MessageLookupByLibrary.simpleMessage("Thông báo"),
        "common_password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "common_phone_number":
            MessageLookupByLibrary.simpleMessage("Số điện thoại"),
        "common_profile": MessageLookupByLibrary.simpleMessage("Tài khoản"),
        "common_saturday": MessageLookupByLibrary.simpleMessage("Thứ Bảy"),
        "common_search": MessageLookupByLibrary.simpleMessage("Tìm kiếm"),
        "common_sunday": MessageLookupByLibrary.simpleMessage("Chủ Nhật"),
        "common_thursday": MessageLookupByLibrary.simpleMessage("Thứ Năm"),
        "common_tuesday": MessageLookupByLibrary.simpleMessage("Thứ Ba"),
        "common_un_allow":
            MessageLookupByLibrary.simpleMessage("Không cho phép"),
        "common_username": MessageLookupByLibrary.simpleMessage("Username"),
        "common_validate_empty_value": m0,
        "common_wednesday": MessageLookupByLibrary.simpleMessage("Thứ Tư"),
        "download_image": MessageLookupByLibrary.simpleMessage("Tải xuống"),
        "editor": MessageLookupByLibrary.simpleMessage("Chỉnh sửa"),
        "enhance_title": MessageLookupByLibrary.simpleMessage("Làm đẹp"),
        "enhance_topbar_title":
            MessageLookupByLibrary.simpleMessage("Face App"),
        "error": MessageLookupByLibrary.simpleMessage("Lỗi"),
        "error_msg": MessageLookupByLibrary.simpleMessage(
            "Đã có lỗi xảy ra. Hãy thử lại sau ít phút"),
        "face_ai_generate": MessageLookupByLibrary.simpleMessage("Tạo"),
        "face_ai_person": MessageLookupByLibrary.simpleMessage("Hình ảnh"),
        "face_ai_popular_searches":
            MessageLookupByLibrary.simpleMessage("Tìm kiếm phổ biến"),
        "faces": MessageLookupByLibrary.simpleMessage("Khuôn mặt"),
        "loading":
            MessageLookupByLibrary.simpleMessage("Xin hãy đợi một chút..."),
        "make_up": MessageLookupByLibrary.simpleMessage("Trang điểm"),
        "no_face_force_warning": MessageLookupByLibrary.simpleMessage(
            "Chức năng này yêu cầu ảnh của bạn phải có khuôn mặt. Xin hãy chọn lại."),
        "no_face_warning": MessageLookupByLibrary.simpleMessage(
            "Ảnh của bạn không có khuôn mặt. Một số chức năng có thể sẽ không hoạt động"),
        "normal": MessageLookupByLibrary.simpleMessage("Bình thường"),
        "normal_enhance":
            MessageLookupByLibrary.simpleMessage("Làm đẹp thường"),
        "out_of_clicks_warning": MessageLookupByLibrary.simpleMessage(
            "Bạn đã hết lượt click. Xin hãy mua thêm để tiếp tục."),
        "overloaded_error": MessageLookupByLibrary.simpleMessage(
            "Server đang quá tải. Hãy thử lại sau ít phút."),
        "payment_amount":
            MessageLookupByLibrary.simpleMessage("Số tiền thanh toán"),
        "permission_camera_message": MessageLookupByLibrary.simpleMessage(
            "Cho phép truy cập chụp ảnh và quay video để chụp hình ảnh cho đánh giá của bạn"),
        "permission_camera_steps_android": MessageLookupByLibrary.simpleMessage(
            "<p>Các bước để cho phép truy cập máy ảnh<br>\n   1. Vào thông tin ứng dụng <b>Face AI</b><br>\n   2. Chọn <b>Quyền</b> > Chọn <b>Máy ảnh</b><br>\n   3. Chọn <b>Chỉ cho phép khi dùng dứng dụng</b> hoặc <b>Luôn hỏi</b></p>"),
        "permission_camera_steps_ios": MessageLookupByLibrary.simpleMessage(
            "<p>Các bước để cho phép truy cập máy ảnh<br>\n   1. Vào thông tin ứng dụng <b>Face AI</b><br>\n   2. Bật quyền <b>Camera</b><br>"),
        "permission_photos_message": MessageLookupByLibrary.simpleMessage(
            "Cho phép truy cập hình ảnh và nội dung nghe nhìn trên thiết bị để tải hình ảnh lên đánh giá của bạn"),
        "permission_photos_steps_android": MessageLookupByLibrary.simpleMessage(
            "<p>Các bước để cho phép truy cập hình ảnh<br>\n   1. Vào thông tin ứng dụng <b>Face AI</b><br>\n   2. Chọn <b>Quyền</b> > Chọn <b>Bộ nhớ</b><br>\n   3. Chọn <b>Chỉ cho phép truy cập vào nội dung nghe nhìn</b></p>"),
        "permission_photos_steps_ios": MessageLookupByLibrary.simpleMessage(
            "<p>Các bước để cho phép truy cập hình ảnh<br>\n   1. Vào thông tin ứng dụng <b>Face AI</b><br>\n   2. Chọn <b>Ảnh</b><br>\n   3. Chọn <b>Ảnh được chọn</b> hoặc <b>Tất cả ảnh</b></p>"),
        "photo_style": MessageLookupByLibrary.simpleMessage("Bằng ảnh"),
        "photo_swap": MessageLookupByLibrary.simpleMessage("Đổi khuôn mặt"),
        "pricing": MessageLookupByLibrary.simpleMessage("Giá cả"),
        "real_style": MessageLookupByLibrary.simpleMessage("Kiểu thực tế"),
        "regenerate_image": MessageLookupByLibrary.simpleMessage("Tạo lại"),
        "remove_background": MessageLookupByLibrary.simpleMessage("Xóa nền"),
        "share": MessageLookupByLibrary.simpleMessage("Chia sẻ"),
        "successfully": MessageLookupByLibrary.simpleMessage("Thành công"),
        "super_enhance":
            MessageLookupByLibrary.simpleMessage("Làm đẹp siêu thực"),
        "super_style": MessageLookupByLibrary.simpleMessage("Kiểu siêu thực"),
        "text_style": MessageLookupByLibrary.simpleMessage("Bằng văn bản"),
        "they_will_appear_here":
            MessageLookupByLibrary.simpleMessage("Ảnh sẽ xuất hiện ở đây"),
        "to_your_photos":
            MessageLookupByLibrary.simpleMessage("Bộ sưu tập của bạn"),
        "validator_phone_at_least_10_digits":
            MessageLookupByLibrary.simpleMessage(
                "Số điện thoại phải có ít nhất 10 chữ số"),
        "validator_please_input_new_phone_number":
            MessageLookupByLibrary.simpleMessage("Nhập số điện thoại mới"),
        "validator_please_input_phone_number":
            MessageLookupByLibrary.simpleMessage("Nhập số điện thoại"),
        "validator_please_input_username":
            MessageLookupByLibrary.simpleMessage("Cập nhật username"),
        "validator_please_input_value": m1,
        "validator_value_is_not_invalid": m2,
        "validator_value_not_correct_format": m3,
        "warning": MessageLookupByLibrary.simpleMessage("Cảnh báo")
      };
}
