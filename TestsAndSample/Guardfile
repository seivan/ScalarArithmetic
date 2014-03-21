# A sample Guardfile
# More info at https://github.com/guard/guard#readme


guard 'xctool-test', :cli => '-workspace Example.xcworkspace -scheme Example test' do
  watch(%r{Example/(.+)\.(m|mm)$})
  watch(%r{ExampleTests/(.+)\.(m|mm)$})
end

