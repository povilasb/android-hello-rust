use jni::objects::{JObject, JString};
use jni::sys::jstring;
use jni::JNIEnv;
use std::ffi::{CStr, CString};
use unwrap::unwrap;

// NOTE: _1 is a special escape sequence so that Java would treat it a an underscore rather than
// dot. See: https://docs.oracle.com/javase/8/docs/technotes/guides/jni/spec/design.html#resolving_native_method_names
#[no_mangle]
pub unsafe extern "C" fn Java_com_example_hello_1rust_MainActivity_hello(
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
