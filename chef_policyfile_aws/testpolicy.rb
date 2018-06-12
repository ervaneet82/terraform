default_source :chef_repo, "../../../cookbooks"
default_source :supermarket

name 'testpolicy'

run_list ['ntp']
