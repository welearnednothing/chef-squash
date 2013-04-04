node.override.users = ['deploy', 'blueboxadmin']
node.override.authorization = {
  'sudo' => {
    'users' => ['deploy','blueboxadmin', 'kitchen'],
    'passwordless' => true
  }  
}
node.override.groups = ["blueboxadmin", "deploy"]

include_recipe "group::data_bag"
include_recipe "user::data_bag"
include_recipe "sudo"

  
