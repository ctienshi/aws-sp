# ----------------------------------------------------------------------------
#  Copyright (c) 2018 WSO2, Inc. http://www.wso2.org
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# ----------------------------------------------------------------------------

# Claas sp_worker::params
# This class includes all the necessary parameters
class sp_worker::params {
  $user = 'wso2carbon'
  $user_group = 'wso2'
  $product = 'wso2sp'
  $product_version = '4.4.0'
  $product_profile = 'worker'
  $service_name = "${product}-${product_profile}"
  $jdk_version = 'JDK_TYPE'

  # JDK Distributions
  if $::osfamily == 'redhat' {
    $lib_dir = "/usr/lib64/wso2"
  }
  elsif $::osfamily == 'debian' {
    $lib_dir = "/usr/lib/wso2"
  }

  if $jdk_version == 'ORACLE_JDK8' {
    $jdk_type = "jdk-8u144-linux-x64"
    $jdk_path = "jdk1.8.0_144"
  } elsif $jdk_version == 'OPEN_JDK8' {
    $jdk_type = "jdk-8u192-ea-bin-b02-linux-x64-19_jul_2018"
    $jdk_path = "jdk1.8.0_192"
  } elsif $jdk_version == 'Corretto_JDK8' {
    $jdk_type = "amazon-corretto-8.202.08.2-linux-x64"
    $jdk_path = "amazon-corretto-8.202.08.2-linux-x64"
  }

  $java_home = "${lib_dir}/${jdk_path}"

  # Define the template
  $start_script_template = "bin/${product_profile}.sh"

  # Directories
  $products_dir = "/usr/local/wso2"

  # Product and installation information
  $product_binary = "${product}-${product_version}.zip"
  $distribution_path = "${products_dir}/${product}/${product_profile}/${product_version}"
  $install_path = "${distribution_path}/${product}-${product_version}"

  # List of files that must contain agent specific configuraitons
  # if $deployment == "dev" {
  #   $config_file_list = [
  #     { "file" => "${install_path}/file1", "key" => "key1", "value" => "value1" },
  #   ]
  # }
  # elsif $deployment == "staging" {
  #   $config_file_list = [
  #     { "file" => "${install_path}/file1", "key" => "key1", "value" => "value1" },
  #   ]
  # }
  # elsif $deployment == "production" {
  #   $config_file_list = [
  #     { "file" => "${install_path}/file1", "key" => "key1", "value" => "value1" },
  #   ]
  # }
}
