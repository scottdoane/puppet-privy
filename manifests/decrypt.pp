# == Define: privy
#
define privy::decrypt (
  $encrypted_file_path = $title,
  $decrypted_file_path,
  $decryption_key_path,
  ) {

  Exec { path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin'}
  exec { "Decrypting $encrypted_file_path to $decrypted_file_path":
    command => "openssl smime -decrypt -in $encrypted_file_path -inform DER -inkey $decryption_key_path -out $decrypted_file_path",
    creates => $decrypted_file_path
  }
}
