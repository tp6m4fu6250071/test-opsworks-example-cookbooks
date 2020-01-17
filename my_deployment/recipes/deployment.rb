ruby_block 'detach_alb' do
  block do
    Chef::Log.info('000 Ready to detach ALB ...')
    run_context.include_recipe "alb_support::detach_from_alb"
  end
end

Chef::Log.info('001')
Chef::Log.info('002')

counter = 0
ruby_block 'test_order0' do
  block do
    Chef::Log.info('003')
    while counter < 10
        Chef::Log.info('004-'+counter.to_s)
      counter += 1
      sleep(1)
    end 
    Chef::Log.info('005')
  end
end

Chef::Log.info('007')

include_recipe 'alb_support::attach_to_alb'
Chef::Log.info('008')
