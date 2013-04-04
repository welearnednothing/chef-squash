node.default.users = ['deploy', 'blueboxadmin']
node.default.authorization = {
  'sudo' => {
    'users' => ['deploy','blueboxadmin'],
    'passwordless' => true
  }  
}
node.default.groups = ["blueboxadmin", "deploy"]

include_recipe "user::data_bag"

  
