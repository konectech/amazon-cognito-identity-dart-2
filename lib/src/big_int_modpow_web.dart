@JS()
library bigint_modpow;

import 'dart:js_interop';

@JS('jsBigIntModPow')
external JSString jsBigIntModPow(String b, String e, String m);

BigInt modPow(BigInt? b, BigInt e, BigInt? m) {  
  if (b != null && m != null) {
    try {
      return BigInt.parse(
        jsBigIntModPow(b.toString(), e.toString(), m.toString()).dartify() as String,
      );
    } on NoSuchMethodError {
      return b.modPow(e, m);
    }
  }
  return BigInt.one;
}
