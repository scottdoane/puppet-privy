define privy::encrypt (
  $encrypted_target_path = $title,
  $decrypted_target_path,
  $decription_key_path,
  ) {

  Exec { path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin'}
  exec { "Decrypting $encrypted_target_path to $decrypted_target_path":
    command => "openssl smime -decrypt -in $encrypted_target_path -inform DER -inkey $decription_key_path -out $decrypted_target_path",
    creates => $decrypted_target_path
  }
}
