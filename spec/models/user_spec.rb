require 'spec_helper'

describe User do
  before { 
    @user = User.new
  }



  subject { @user }
  it { should respond_to(:username)}
  it { @user.username = ""
       @user.should_not be_valid}
  it { should respond_to(:name)}
  it { @user.name = ""
       @user.should_not be_valid}
  it { should respond_to(:email)}
  it { @user.email = ""
       @user.should_not be_valid}
  it { should respond_to(:type)}
  it { @user.type = nil
       @user.should_not be_valid}
  it { should respond_to(:status)}
  it { @user.status = nil
       @user.should_not be_valid}
  
    
end
