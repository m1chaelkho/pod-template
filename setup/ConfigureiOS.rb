module Pod

  class ConfigureIOS
    attr_reader :configurator

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform
      
      framework = configurator.ask_with_answers("What testing frameworks will you use", ["Specta", "Kiwi"]).to_sym
      case framework
        when :specta
          configurator.add_pod_to_podfile "Specta"
          configurator.add_pod_to_podfile "Expecta"
        when :kiwi
          configurator.add_pod_to_podfile "Kiwi"
      end
      
      snapshots = configurator.ask_with_answers("Would you like to do view based testing", ["Yes", "No"]).to_sym
      case snapshots
        when :yes
          configurator.add_pod_to_podfile "FBSnapshotTestCase"
          configurator.add_pod_to_podfile "EXPMatchers+FBSnapshotTest" if framework == :specta
      end
      
      remove_demo = configurator.ask_with_answers("Would you like to have a demo project also", ["Yes", "No"]).to_sym
      
      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/ios/Example/PROJECT.xcodeproj",
        :platform => :ios,
        :remove_demo_project => (remove_demo == :no)
      }).run
      
      `mv ./templates/ios/* ./`
    end
  end
  
end