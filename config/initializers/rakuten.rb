RakutenWebService.configure do |c|
  c.application_id = Rails.application.credentials.RWS_APPLICATION_ID
  c.affiliate_id = Rails.application.credentials.RWS_AFFILIATION_ID
end
