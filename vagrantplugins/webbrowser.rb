require 'timeout'
require 'mario'
require 'vagrant'


class SomeCommand < Vagrant::Command::Base

  def run_something
    if Mario::Platform.windows?
      raise Errors::SSHUnavailableWindows, :key_path => env.config.ssh.private_key_path,
            :ssh_port => port()
    end

    raise Errors::SSHUnavailable if !Kernel.system("which ssh > /dev/null 2>&1")

    options = {}
    options[:port] = port()
    [:username, :private_key_path].each do |param|
      options[param] = env.config.ssh.send(param)
    end

    check_key_permissions(options[:private_key_path])

    # Command line options
    command_options = ["-p #{options[:port]}", "-o UserKnownHostsFile=/dev/null",
                       "-o StrictHostKeyChecking=no", "-o IdentitiesOnly=yes",
                       "-o ForwardX11=yes",
                       "-i #{options[:private_key_path]}"]
    command_options << "-o ForwardAgent=yes" if env.config.ssh.forward_agent

    # Some hackery going on here. On Mac OS X Leopard (10.5), exec fails
    # (GH-51). As a workaround, we fork and wait. On all other platforms,
    # we simply exec.
    pid = nil
    pid = fork if Vagrant::Util::Platform.leopard? || Vagrant::Util::Platform.tiger?
    Kernel.exec "ssh #{command_options.join(" ")} #{options[:username]}@#{options[:host]} #{@browser}".strip if pid.nil?
    Process.wait(pid) if pid
  end


  def check_key_permissions(key_path)
    # Windows systems don't have this issue
    return if Mario::Platform.windows?

    stat = File.stat(key_path)

    if stat.owned? && file_perms(key_path) != "600"
      File.chmod(0600, key_path)

      raise Errors::SSHKeyBadPermissions, :key_path => key_path if file_perms(key_path) != "600"
    end
  rescue Errno::EPERM
    # This shouldn't happen since we verify we own the file, but just
    # in case.
    raise Errors::SSHKeyBadPermissions, :key_path => key_path
  end


  def port

    vm = target_vms.detect { |v| v.name == :desktop }

    pnum = nil
    vm.vm.network_adapters.each do |na|
      pnum = na.nat_driver.forwarded_ports.detect do |fp|
        fp.name == env.config.ssh.forwarded_port_key
      end
      break if pnum
    end

    return pnum.hostport if pnum

    # Fall back to the default
    return env.config.ssh.port
  end

end


class FirefoxCommand < SomeCommand

  register "firefox", "Starts a remote firefox."

  def initialize(*args)
    super
    @browser = "firefox"
  end

end


class CromiumCommand < SomeCommand

  register "chromium", "Starts a remote Chromium."

  def initialize(*args)
    super
    @browser = "chromium-browser"
  end

end