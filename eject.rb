#-*- coding: utf-8 -*-

Plugin.create :eject do
  command(:eject,
          name: 'eject',
          condition: lambda{|opt| true},
          visible: false,
          icon: "#{File.dirname(__FILE__)}/cd_eject.png",
          role: :window) do |opt|
    Thread.new {
      system("eject -T #{UserConfig[:eject_device]}")
    }
  end

  UserConfig[:eject_device] ||= ''
  settings 'eject' do
    fileselect 'Device', :eject_device
  end
end
