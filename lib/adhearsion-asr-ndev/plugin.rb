# encoding: utf-8
module AdhearsionASR::Ndev
  class Plugin < Adhearsion::Plugin
    config :adhearsion_asr_ndev do
      auto_include true, transform: Proc.new { |v| v == 'true' }, desc: "Enable or disable auto inclusion of overridden Adhearsion Core methods in all call controllers."
      #min_confidence 0.5, desc: 'The default minimum confidence level used for all recognizer invocations.', transform: Proc.new { |v| v.to_f }
      timeout 5, desc: 'The default timeout (in seconds) used for all recognizer invocations.', transform: Proc.new { |v| v.to_i }
      input_language 'en-US', desc: 'The default language set on generated grammars. Set nil to use platform default.'
      app_id '', desc: 'Nuance NDEV App ID'
      app_key '', desc: 'Nuance NDEV App Key'
    end

    init after: :adhearsion_asr do
      if config[:auto_include]
        ::Adhearsion::CallController.mixin ::AdhearsionASR::Ndev::ControllerMethods
      end

      # FIXME
      ::AdhearsionASR::Ndev::Client.supervise_as :ndev_speech, config[:app_id], config[:app_key]

    end
  end
end
