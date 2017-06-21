#
# Cookbook:: diplomado_linux
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'diplomado_linux::default' do
    context 'when run on Centos 7.3.1611' do
        let(:chef_run) do
            runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3.1611')
            runner.converge(described_recipe)
        end

        it 'converges successfully' do
            expect{ chef_run }.to_not raise_error
        end

        it 'installs httpd' do
            expect(chef_run).to install_package 'httpd'
        end

        it 'enables the httpd service' do
            expect(chef_run).to enable_service 'httpd'
        end

        it 'starts the httpd service' do
            expect(chef_run).to start_service 'httpd'
        end
    end
end
