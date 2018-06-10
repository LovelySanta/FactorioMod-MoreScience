if not MoreScience.lib.debug then MoreScience.lib.debug = {}

  function MoreScience.lib.debug.log(message)
    if MoreScience.lib.debug.enabled then
      log(message)
    end
  end

  function MoreScience.lib.debug.enable()
    MoreScience.lib.debug.enabled = true
  end

  function MoreScience.lib.debug.disable()
    MoreScience.lib.debug.enabled = false
  end

end -- end of MoreScience.lib.debug
