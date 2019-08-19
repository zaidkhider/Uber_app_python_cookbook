#
# Cookbook:: python
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'python::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'should install nginx' do
      expect(chef_run).to install_package "python"
    end
    it 'should install pip for python' do
      expect(chef_run).to install_package 'python-pip'
    end
    it 'should use pip to install plugins' do
      expect(chef_run).to run_execute('python-pip install plugins')
    end
    it 'should install two plugins for gnureadline' do
      expect(chef_run).to install_package 'libncurses5-dev'
      expect(chef_run).to install_package 'libffi-dev'
    end
    it 'should install the python plugins' do
      expect(chef_run).to run_execute 'pip install Flask==0.10.1'
      expect(chef_run).to run_execute 'pip install Jinja2==2.7.3'
      expect(chef_run).to run_execute 'pip install MarkUpSafe==0.23'
      expect(chef_run).to run_execute 'pip install Werkzeug==0.9.6'
      expect(chef_run).to run_execute 'pip install gnureadline==6.3.3'
      expect(chef_run).to run_execute 'pip install itsdangerous==0.24'
      expect(chef_run).to run_execute 'pip install rauth==0.7.0'
      expect(chef_run).to run_execute 'pip install requests==2.3.0'
      expect(chef_run).to run_execute 'pip install wsgiref==0.1.2'
      expect(chef_run).to run_execute 'pip install gunicorn==18.0'
      expect(chef_run).to run_execute 'pip install Flask-SSLify==0.1.4'
      expect(chef_run).to run_execute 'pip install pytest==2.5.2'
      expect(chef_run).to run_execute 'pip install pytest-cov==1.6'
      expect(chef_run).to run_execute 'pip install betamax==0.4.0'
      expect(chef_run).to run_execute 'pip install flake8==2.1.0'
      expect(chef_run).to run_execute 'pip install pep8==1.5.6'
      expect(chef_run).to run_execute 'pip install pyflakes==0.8.1'
      expect(chef_run).to run_execute 'pip install coveralls==0.4.2'

    end
  end
end
