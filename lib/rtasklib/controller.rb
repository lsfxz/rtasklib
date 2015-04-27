module Rtasklib

  module Controller

    def create
    end

    def update
    end

    def get
    end

    def all
      res, ec = Execute.task(@override_str, "export")
    end

    def get_version
      raw, ec = Execute.task(@override_str, "_version")
      if ec == 0
        return to_gem_version(raw)
      else
        return nil
      end
    end

    # Convert "1.6.2 (adf342jsd)" to Gem::Version object
    def to_gem_version raw
      std_ver = raw.chomp.gsub(' ','.').delete('(').delete(')')
      p std_ver
      Gem::Version.new std_ver
    end
  end
end
