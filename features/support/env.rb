require 'simplecov'

puts "SimpleCov is loaded!"
# 设置SimpleCov的配置选项
SimpleCov.start do
  # 指定要排除的文件或目录，以便不计入覆盖率报告
  # 这里可以指定输出覆盖率报告的目录，如果没有指定，默认会输出到 coverage 目录下
  # add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  # add_group 'Helpers', 'app/helpers'
  # add_group 'Libraries', 'lib'
end

require 'cucumber'

