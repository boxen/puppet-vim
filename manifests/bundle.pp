# Will fetch and save gihub repositories in your bundle directory
define vim::bundle() {
  $bundle = split($name, '/')
  repository { "$vim::home/.vim/bundle/${bundle[1]}":
    source  => $name,
  }
}
