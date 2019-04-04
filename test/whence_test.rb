require_relative "./test_helper"

class WhenceTest < Minitest::Test
  def test_tree
    original_stdout = $stdout
    $stdout = StringIO.new

    Whence.whence
    Whence.tree

    assert_equal data.last, $stdout.string
  ensure
    $stdout = original_stdout
  end

  def call_whence
    Whence.whence
  end

  def data
    File.read(__FILE__).split(/^__END__\n/, 2)
  end
end
__END__
└ test/whence_test.rb:8:in `test_tree' 1
  └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest/test.rb:98:in `block (3 levels) in run' 1
    └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest/test.rb:195:in `capture_exceptions' 1
      └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest/test.rb:95:in `block (2 levels) in run' 1
        └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:265:in `time_it' 1
          └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest/test.rb:94:in `block in run' 1
            └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:360:in `on_signal' 1
              └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest/test.rb:211:in `with_info_handler' 1
                └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest/test.rb:93:in `run' 1
                  └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:960:in `run_one_method' 1
                    └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:334:in `run_one_method' 1
                      └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:321:in `block (2 levels) in run' 1
                        └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:320:in `each' 1
                          └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:320:in `block in run' 1
                            └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:360:in `on_signal' 1
                              └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:347:in `with_info_handler' 1
                                └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:319:in `run' 1
                                  └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:159:in `block in __run' 1
                                    └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:159:in `map' 1
                                      └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:159:in `__run' 1
                                        └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:136:in `run' 1
                                          └ /Users/caleb.thompson/code/.gem/ruby/2.3.7/gems/minitest-5.11.3/lib/minitest.rb:63:in `block in autorun' 1
