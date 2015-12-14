class raspberry_dev::toolchain {
  $toolchain_url = 'http://io.develephant.com:10000/raspberrypi/raspberry-gcc-toolchain_2.0_x86_64.deb'
  $toolchain_deb_filename = 'raspberry-gcc-toolchain_2.0_x86_64.deb'

  exec {'download-toolchain':
    command => "curl -L ${toolchain_url} -o ${toolchain_deb_filename}",
    cwd => $raspberry_dev::config::debs_dir,
    creates => "${raspberry_dev::config::debs_dir}/${toolchain_deb_filename}"

  } -> package {'raspberry-gcc-toolchain':
    provider => dpkg,
    ensure => installed,
    source => "${raspberry_dev::config::debs_dir}/${toolchain_deb_filename}"
  }
}
