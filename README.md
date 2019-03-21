### Home test for Candidate

#### Ứng dụng từ khoá hot
Ứng dụng có một màn hình chính để thể hiện giả lập danh sách các từ khóa hot mà user tìm kiếm trên trang web thương mại điện tử Tiki.vn. 
#### Từ khoá hot
[![Hot-Keyword-Photo.png](https://salt.tikicdn.com/ts/upload/a1/dc/e2/26ea3b652ba6f561491a5c928c5bb62d.png)](https://salt.tikicdn.com/ts/upload/a1/dc/e2/26ea3b652ba6f561491a5c928c5bb62d.png)

Dữ liệu từ khoá hot được lấy về từ [https://tiki-mobile.s3-ap-southeast-1.amazonaws.com/ios/keywords.json](https://tiki-mobile.s3-ap-southeast-1.amazonaws.com/ios/keywords.json)
1 từ khoá hot sẽ có nội dung và hình ảnh được thể hiện giống như UI:

> Padding 2 bên 16px.

> Font size 14px.

Lưu ý phần hiển thị nội dung từ khoá có các rules sau:

> Nếu nội dung chỉ có 1 từ thì sẽ hiển thị 1 dòng.

> Nếu nội dung có nhiều hơn 1 từ thì sẽ hiển thị 2 dòng. Nội dung được align center. **Nội dung từ khóa phải hiển thị đầy đủ, không bị truncate**

> Cần **tính toán** chiều rộng của vùng hiển thị nội dung sao cho **chiều rộng đó là nhỏ nhất có thể**.

> Background color của phần nội dung được lấy theo thứ tự  #16702e, #005a51, #996c00, #5c0a6b, #006d90, #974e06, #99272e, #89221f, #00345d.


### Yêu cầu:

> Ứng dụng được viết bằng Swift 4 trên Xcode bản mới nhất.

> Tổ chức cấu trúc cho tầng networking.

> Ứng viên làm bài và gửi lại link github của project.

> UI đẹp và Unit Test là điểm cộng thêm.

