# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Nofoodloss::Application.initialize!

# to_s(�Ǝ��t�H�[�}�b�g)�̒�`
Time::DATE_FORMATS[:org_format] = "%Y-%m-%d  %a"