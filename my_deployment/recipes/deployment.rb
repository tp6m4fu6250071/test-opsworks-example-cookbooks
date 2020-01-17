ruby_block 'detach_alb' do
  block do
    Chef::Log.info('Chef::Log-000 Ready to detach ALB ...')
    puts ('puts-000')
    run_context.include_recipe "alb_support::detach_from_alb"
  end
end

Chef::Log.info('Chef::Log-001')
puts ('puts-001')
Chef::Log.info('Chef::Log-002')
puts ('puts-002')

counter = 0
ruby_block 'test_order0' do
  block do
    Chef::Log.info('Chef::Log-003')
    puts ('puts-003')
    while counter < 5
        Chef::Log.info('Chef::Log-004-'+counter.to_s)
	puts ('puts-004')
      counter += 1
      sleep(1)
    end 
    Chef::Log.info('Chef::Log-005')
    puts ('puts-005')
  end
end

Chef::Log.info('Chef::Log-006')
puts ('puts-006')

include_recipe 'alb_support::attach_to_alb'
Chef::Log.info('Chef::Log-007')
puts ('puts-007')
