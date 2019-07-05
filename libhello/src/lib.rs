use jni::objects::{JObject, JString};
use jni::sys::jstring;
use jni::JNIEnv;
use std::ffi::{CStr, CString};
use unwrap::unwrap;

#[no_mangle]
pub unsafe extern "C" fn Java_com_example_android_MainActivity_hello(
    env: JNIEnv,
    _: JObject,
    j_recipient: JString,
) -> jstring {
    let recipient = CString::from(CStr::from_ptr(
        unwrap!(env.get_string(j_recipient)).as_ptr(),
    ));

    let res = unwrap!(env.new_string("Hello ".to_owned() + unwrap!(recipient.to_str())));
    res.into_inner()
}
