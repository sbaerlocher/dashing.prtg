#!/usr/bin/env ruby
require 'rest-client'
require 'json'

prtgurl = ''
prtgusername = ''
prtgpassword = ''
prtgacknowledged = 'true'
prtgwarning = 'true'
prtgunusual = "true"

SCHEDULER.every '30s', :first_in => 0 do |job|
  url = prtgurl+'/api/table.json?username='+prtgusername+'&password='+prtgpassword+'&content=sensors&output=json&columns=group,device,message,status&sortby=status&filter_status=5'
  raw_down  = JSON.parse(RestClient.get(url))
  downs = raw_down['sensors'].map { |prtg| 
    { 
      group: prtg['group'],
      device: prtg['device'],
      message: prtg['message'].gsub!(/<("[^"]*"|'[^']*'|[^'">])*>/, ''),   
    }
  }
  if prtgacknowledged == 'true'
    url_acknowledged = prtgurl+'/api/table.json?username='+prtgusername+'&password='+prtgpassword+'&content=sensors&output=json&columns=group,device,message,status&sortby=status&filter_status=13'
    raw_acknowledged = JSON.parse(RestClient.get(url_acknowledged))
    acknowledgeds = raw_acknowledged['sensors'].map { |prtg| 
      { 
        group: prtg['group'],
        device: prtg['device'],
        message: prtg['message'].gsub!(/<("[^"]*"|'[^']*'|[^'">])*>/, ''),   
      }
    }
  end
  if prtgwarning == 'true'
    url_warning = prtgurl+'/api/table.json?username='+prtgusername+'&password='+prtgpassword+'&content=sensors&output=json&columns=group,device,message,status&sortby=status&filter_status=4'
    raw_warning = JSON.parse(RestClient.get(url_warning))
    warnings = raw_warning ['sensors'].map { |prtg| 
      {
        group: prtg['group'],
        device: prtg['device'],
        message: prtg['message'].gsub!(/<("[^"]*"|'[^']*'|[^'">])*>/, ''),   
      }
    }
  end
  if prtgunusual == 'true'
    url_warning = prtgurl+'/api/table.json?username='+prtgusername+'&password='+prtgpassword+'&content=sensors&output=json&columns=group,device,message,status&sortby=status&filter_status=10'
    raw_warning = JSON.parse(RestClient.get(url_warning))
    warnings = raw_warning ['sensors'].map { |prtg| 
      {
        group: prtg['group'],
        device: prtg['device'],
        message: prtg['message'].gsub!(/<("[^"]*"|'[^']*'|[^'">])*>/, ''),   
      }
    }
  end

  titles  = {}
  if downs.size > 0
    titles['downs'] = 'Downs'
  end
  if acknowledgeds.size > 0
    titles['acknowledgeds'] = 'Downs (Acknowledgeds)'
  end
  if warnings.size > 0
    titles['warnings'] = 'Warnings'
  end
  if unusuals.size > 0
    titles['unusuals'] = 'Unusuals'
  end
  if downs.size == 0 && acknowledgeds.size == 0 && warnings.size == 0
    titles['notification'] = 'There are no reports available'
  end
	
  send_event('prtg', { downs: downs, acknowledgeds: acknowledgeds, warnings: warnings, titles: titles})
end
