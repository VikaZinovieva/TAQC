def my_account_page
  @my_account_page ||= MyAccountPage.new
end

def sign_in_page
  @sign_in_page ||= SignInPage.new
end

def landing_page
  @landing_page ||= LandingPage.new
end

# 2.7.0 :004 > class A
# 2.7.0 :005 >   def initialize(var)
# 2.7.0 :006 >     @var = var
# 2.7.0 :007 >   end
# 2.7.0 :008 > end
#  => :initialize
# 2.7.0 :009 >
# 2.7.0 :010 > def var(var)
# 2.7.0 :011 >   @var ||= A.new(var)
# 2.7.0 :012 > end
#  => :var
# 2.7.0 :013 >
# 2.7.0 :014 > A.new(2)
#  => #<A:0x00007f985b95f358 @var=2>
# 2.7.0 :015 > var(3)
#  => #<A:0x00007f985b91e358 @var=3>
# 2.7.0 :016 > var(4)
#  => #<A:0x00007f985b91e358 @var=3>
# 2.7.0 :017 >