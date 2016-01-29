##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class IncomingPhoneNumberList < ListResource
            ##
            # Initialize the IncomingPhoneNumberList
            # @param [Version] version Version that contains the resource
            # @param [String] owner_account_sid A 34 character string that uniquely identifies
            #   this resource.
            
            # @return [IncomingPhoneNumberList] IncomingPhoneNumberList
            def initialize(version, owner_account_sid: nil)
              super(version)
              
              # Path Solution
              @solution = {
                  owner_account_sid: owner_account_sid
              }
              @uri = "/Accounts/#{@solution[:owner_account_sid]}/IncomingPhoneNumbers.json"
              
              # Components
              @local = nil
              @mobile = nil
              @toll_free = nil
            end
            
            ##
            # Lists IncomingPhoneNumberInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Boolean] beta Include phone numbers new to the Twilio platform
            # @param [String] friendly_name Only show the incoming phone number resources with
            #   friendly names that exactly match this name
            # @param [String] phone_number Only show the incoming phone number resources that
            #   match this pattern
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            
            # @return [Array] Array of up to limit results
            def list(beta: nil, friendly_name: nil, phone_number: nil, limit: nil, page_size: nil)
              self.stream(
                  beta: beta,
                  friendly_name: friendly_name,
                  phone_number: phone_number,
                  limit: limit,
                  page_size: page_size
              ).entries
            end
            
            ##
            # Streams IncomingPhoneNumberInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Boolean] beta Include phone numbers new to the Twilio platform
            # @param [String] friendly_name Only show the incoming phone number resources with
            #   friendly names that exactly match this name
            # @param [String] phone_number Only show the incoming phone number resources that
            #   match this pattern
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(beta: nil, friendly_name: nil, phone_number: nil, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)
              
              page = self.page(
                  beta: beta,
                  friendly_name: friendly_name,
                  phone_number: phone_number,
                  page_size: limits['page_size'],
              )
              
              @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
            end
            
            ##
            # When passed a block, yields IncomingPhoneNumberInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Boolean] beta Include phone numbers new to the Twilio platform
            # @param [String] friendly_name Only show the incoming phone number resources with
            #   friendly names that exactly match this name
            # @param [String] phone_number Only show the incoming phone number resources that
            #   match this pattern
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to read the
            #                       limit with the most efficient page size, i.e. min(limit, 1000)
            def each
              limits = @version.read_limits
              
              page = self.page(
                  page_size: limits['page_size'],
              )
              
              @version.stream(page,
                              limit: limits['limit'],
                              page_limit: limits['page_limit']).each {|x| yield x}
            end
            
            ##
            # Retrieve a single page of IncomingPhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [Boolean] beta Include phone numbers new to the Twilio platform
            # @param [String] friendly_name Only show the incoming phone number resources with
            #   friendly names that exactly match this name
            # @param [String] phone_number Only show the incoming phone number resources that
            #   match this pattern
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            
            # @return [Page] Page of IncomingPhoneNumberInstance
            def page(beta: nil, friendly_name: nil, phone_number: nil, page_token: nil, page_number: nil, page_size: nil)
              params = {
                  'Beta' => beta,
                  'FriendlyName' => friendly_name,
                  'PhoneNumber' => phone_number,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              }
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return IncomingPhoneNumberPage.new(@version, response, @solution)
            end
            
            ##
            # Retrieve a single page of IncomingPhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] api_version Calls to this phone number will start a new TwiML
            #   session with this API version.
            # @param [String] friendly_name A human readable descriptive text for this
            #   resource, up to 64 characters long. By default, the `FriendlyName` is a nicely
            #   formatted version of the phone number.
            # @param [String] sms_application_sid The 34 character sid of the application
            #   Twilio should use to handle SMSs sent to this number. If a `SmsApplicationSid`
            #   is present, Twilio will ignore all of the SMS urls above and use those set on
            #   the application.
            # @param [String] sms_fallback_method The HTTP method Twilio will use when
            #   requesting the above URL. Either `GET` or `POST`.
            # @param [String] sms_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML from `SmsUrl`.
            # @param [String] sms_method The HTTP method Twilio will use when making requests
            #   to the `SmsUrl`. Either `GET` or `POST`.
            # @param [String] sms_url The URL Twilio will request when receiving an incoming
            #   SMS message to this number.
            # @param [String] status_callback The URL that Twilio will request to pass status
            #   parameters (such as call ended) to your application.
            # @param [String] status_callback_method The HTTP method Twilio will use to make
            #   requests to the `StatusCallback` URL. Either `GET` or `POST`.
            # @param [String] voice_application_sid The 34 character sid of the application
            #   Twilio should use to handle phone calls to this number. If a
            #   `VoiceApplicationSid` is present, Twilio will ignore all of the voice urls above
            #   and use those set on the application. Setting a `VoiceApplicationSid` will
            #   automatically delete your `TrunkSid` and vice versa.
            # @param [Boolean] voice_caller_id_lookup Look up the caller's caller-ID name from
            #   the CNAM database ($0.01 per look up). Either `true` or `false`.
            # @param [String] voice_fallback_method The HTTP method Twilio will use when
            #   requesting the `VoiceFallbackUrl`. Either `GET` or `POST`.
            # @param [String] voice_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML requested by `Url`.
            # @param [String] voice_method The HTTP method Twilio will use when requesting the
            #   above `Url`. Either `GET` or `POST`.
            # @param [String] voice_url The URL Twilio will request when this phone number
            #   receives a call. The VoiceURL will  no longer be used if a `VoiceApplicationSid`
            #   or a `TrunkSid` is set.
            # @param [String] phone_number The phone number to purchase. e.g., +16175551212
            #   (E.164 format)
            # @param [String] area_code The desired area code for the new phone number. Any
            #   three digit US or Canada rea code is valid
            
            # @return [IncomingPhoneNumberInstance] Newly created IncomingPhoneNumberInstance
            def create(api_version: nil, friendly_name: nil, sms_application_sid: nil, sms_fallback_method: nil, sms_fallback_url: nil, sms_method: nil, sms_url: nil, status_callback: nil, status_callback_method: nil, voice_application_sid: nil, voice_caller_id_lookup: nil, voice_fallback_method: nil, voice_fallback_url: nil, voice_method: nil, voice_url: nil, phone_number: nil, area_code: nil)
              data = {
                  'PhoneNumber' => phone_number,
                  'AreaCode' => area_code,
                  'ApiVersion' => api_version,
                  'FriendlyName' => friendly_name,
                  'SmsApplicationSid' => sms_application_sid,
                  'SmsFallbackMethod' => sms_fallback_method,
                  'SmsFallbackUrl' => sms_fallback_url,
                  'SmsMethod' => sms_method,
                  'SmsUrl' => sms_url,
                  'StatusCallback' => status_callback,
                  'StatusCallbackMethod' => status_callback_method,
                  'VoiceApplicationSid' => voice_application_sid,
                  'VoiceCallerIdLookup' => voice_caller_id_lookup,
                  'VoiceFallbackMethod' => voice_fallback_method,
                  'VoiceFallbackUrl' => voice_fallback_url,
                  'VoiceMethod' => voice_method,
                  'VoiceUrl' => voice_url,
              }
              
              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )
              
              return IncomingPhoneNumberInstance.new(
                  @version,
                  payload,
                  owner_account_sid: @solution['owner_account_sid'],
              )
            end
            
            ##
            # Access the local
            # @return [LocalList] LocalList
            def local
              @local ||= LocalList.new(
                  @version,
                  owner_account_sid: @solution[:owner_account_sid],
              )
            end
            
            ##
            # Access the mobile
            # @return [MobileList] MobileList
            def mobile
              @mobile ||= MobileList.new(
                  @version,
                  owner_account_sid: @solution[:owner_account_sid],
              )
            end
            
            ##
            # Access the toll_free
            # @return [TollFreeList] TollFreeList
            def toll_free
              @toll_free ||= TollFreeList.new(
                  @version,
                  owner_account_sid: @solution[:owner_account_sid],
              )
            end
            
            ##
            # Constructs a IncomingPhoneNumberContext
            # @param [String] sid The incoming-phone-number Sid that uniquely identifies this
            #   resource
            
            # @return [IncomingPhoneNumberContext] IncomingPhoneNumberContext
            def get(sid)
              IncomingPhoneNumberContext.new(
                  @version,
                  owner_account_sid: @solution[:owner_account_sid],
                  sid: sid,
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.IncomingPhoneNumberList>'
            end
          end
        
          class IncomingPhoneNumberPage < Page
            ##
            # Initialize the IncomingPhoneNumberPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] owner_account_sid A 34 character string that uniquely identifies
            #   this resource.
            
            # @return [IncomingPhoneNumberPage] IncomingPhoneNumberPage
            def initialize(version, response, solution)
              super(version, response)
              
              # Path Solution
              @solution = solution
            end
            
            ##
            # Build an instance of IncomingPhoneNumberInstance
            # @param [Hash] payload Payload response from the API
            
            # @return [IncomingPhoneNumberInstance] IncomingPhoneNumberInstance
            def get_instance(payload)
              return IncomingPhoneNumberInstance.new(
                  @version,
                  payload,
                  owner_account_sid: @solution['owner_account_sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.IncomingPhoneNumberPage>'
            end
          end
        
          class IncomingPhoneNumberContext < InstanceContext
            ##
            # Initialize the IncomingPhoneNumberContext
            # @param [Version] version Version that contains the resource
            # @param [String] owner_account_sid The owner_account_sid
            # @param [String] sid The incoming-phone-number Sid that uniquely identifies this
            #   resource
            
            # @return [IncomingPhoneNumberContext] IncomingPhoneNumberContext
            def initialize(version, owner_account_sid, sid)
              super(version)
              
              # Path Solution
              @solution = {
                  owner_account_sid: owner_account_sid,
                  sid: sid,
              }
              @uri = "/Accounts/#{@solution[:owner_account_sid]}/IncomingPhoneNumbers/#{@solution[:sid]}.json"
            end
            
            ##
            # Update the IncomingPhoneNumberInstance
            # @param [String] account_sid The unique id of the Account to which you wish to
            #   transfer this phnoe number
            # @param [String] api_version Calls to this phone number will start a new TwiML
            #   session with this API version.
            # @param [String] friendly_name A human readable descriptive text for this
            #   resource, up to 64 characters long. By default, the `FriendlyName` is a nicely
            #   formatted version of the phone number.
            # @param [String] sms_application_sid The 34 character sid of the application
            #   Twilio should use to handle SMSs sent to this number. If a `SmsApplicationSid`
            #   is present, Twilio will ignore all of the SMS urls above and use those set on
            #   the application.
            # @param [String] sms_fallback_method The HTTP method Twilio will use when
            #   requesting the above URL. Either `GET` or `POST`.
            # @param [String] sms_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML from `SmsUrl`.
            # @param [String] sms_method The HTTP method Twilio will use when making requests
            #   to the `SmsUrl`. Either `GET` or `POST`.
            # @param [String] sms_url The URL Twilio will request when receiving an incoming
            #   SMS message to this number.
            # @param [String] status_callback The URL that Twilio will request to pass status
            #   parameters (such as call ended) to your application.
            # @param [String] status_callback_method The HTTP method Twilio will use to make
            #   requests to the `StatusCallback` URL. Either `GET` or `POST`.
            # @param [String] voice_application_sid The 34 character sid of the application
            #   Twilio should use to handle phone calls to this number. If a
            #   `VoiceApplicationSid` is present, Twilio will ignore all of the voice urls above
            #   and use those set on the application. Setting a `VoiceApplicationSid` will
            #   automatically delete your `TrunkSid` and vice versa.
            # @param [Boolean] voice_caller_id_lookup Look up the caller's caller-ID name from
            #   the CNAM database ($0.01 per look up). Either `true` or `false`.
            # @param [String] voice_fallback_method The HTTP method Twilio will use when
            #   requesting the `VoiceFallbackUrl`. Either `GET` or `POST`.
            # @param [String] voice_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML requested by `Url`.
            # @param [String] voice_method The HTTP method Twilio will use when requesting the
            #   above `Url`. Either `GET` or `POST`.
            # @param [String] voice_url The URL Twilio will request when this phone number
            #   receives a call. The VoiceURL will  no longer be used if a `VoiceApplicationSid`
            #   or a `TrunkSid` is set.
            
            # @return [IncomingPhoneNumberInstance] Updated IncomingPhoneNumberInstance
            def update(account_sid: nil, api_version: nil, friendly_name: nil, sms_application_sid: nil, sms_fallback_method: nil, sms_fallback_url: nil, sms_method: nil, sms_url: nil, status_callback: nil, status_callback_method: nil, voice_application_sid: nil, voice_caller_id_lookup: nil, voice_fallback_method: nil, voice_fallback_url: nil, voice_method: nil, voice_url: nil)
              data = {
                  'AccountSid' => account_sid,
                  'ApiVersion' => api_version,
                  'FriendlyName' => friendly_name,
                  'SmsApplicationSid' => sms_application_sid,
                  'SmsFallbackMethod' => sms_fallback_method,
                  'SmsFallbackUrl' => sms_fallback_url,
                  'SmsMethod' => sms_method,
                  'SmsUrl' => sms_url,
                  'StatusCallback' => status_callback,
                  'StatusCallbackMethod' => status_callback_method,
                  'VoiceApplicationSid' => voice_application_sid,
                  'VoiceCallerIdLookup' => voice_caller_id_lookup,
                  'VoiceFallbackMethod' => voice_fallback_method,
                  'VoiceFallbackUrl' => voice_fallback_url,
                  'VoiceMethod' => voice_method,
                  'VoiceUrl' => voice_url,
              }
              
              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )
              
              return IncomingPhoneNumberInstance.new(
                  @version,
                  payload,
                  owner_account_sid: @solution['owner_account_sid'],
                  sid: @solution['sid'],
              )
            end
            
            ##
            # Fetch a IncomingPhoneNumberInstance
            # @return [IncomingPhoneNumberInstance] Fetched IncomingPhoneNumberInstance
            def fetch
              params = {}
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return IncomingPhoneNumberInstance.new(
                  @version,
                  payload,
                  owner_account_sid: @solution['owner_account_sid'],
                  sid: @solution['sid'],
              )
            end
            
            ##
            # Deletes the IncomingPhoneNumberInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              return @version.delete('delete', @uri)
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.IncomingPhoneNumberContext #{context}>"
            end
          end
        
          class IncomingPhoneNumberInstance < InstanceResource
            ##
            # Initialize the IncomingPhoneNumberInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] owner_account_sid A 34 character string that uniquely identifies
            #   this resource.
            # @param [String] sid The incoming-phone-number Sid that uniquely identifies this
            #   resource
            
            # @return [IncomingPhoneNumberInstance] IncomingPhoneNumberInstance
            def initialize(version, payload, owner_account_sid: nil, sid: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'address_requirements' => payload['address_requirements'],
                  'api_version' => payload['api_version'],
                  'beta' => payload['beta'],
                  'capabilities' => payload['capabilities'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'phone_number' => payload['phone_number'],
                  'sid' => payload['sid'],
                  'sms_application_sid' => payload['sms_application_sid'],
                  'sms_fallback_method' => payload['sms_fallback_method'],
                  'sms_fallback_url' => payload['sms_fallback_url'],
                  'sms_method' => payload['sms_method'],
                  'sms_url' => payload['sms_url'],
                  'status_callback' => payload['status_callback'],
                  'status_callback_method' => payload['status_callback_method'],
                  'uri' => payload['uri'],
                  'voice_application_sid' => payload['voice_application_sid'],
                  'voice_caller_id_lookup' => payload['voice_caller_id_lookup'],
                  'voice_fallback_method' => payload['voice_fallback_method'],
                  'voice_fallback_url' => payload['voice_fallback_url'],
                  'voice_method' => payload['voice_method'],
                  'voice_url' => payload['voice_url'],
              }
              
              # Context
              @instance_context = nil
              @params = {
                  'owner_account_sid' => owner_account_sid,
                  'sid' => sid || @properties['sid'],
              }
            end
            
            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            
            # @return [IncomingPhoneNumberContext] IncomingPhoneNumberContext for this IncomingPhoneNumberInstance
            def context
              unless @instance_context
                @instance_context = IncomingPhoneNumberContext.new(
                    @version,
                    @params['owner_account_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end
            
            def account_sid
              @properties['account_sid']
            end
            
            def address_requirements
              @properties['address_requirements']
            end
            
            def api_version
              @properties['api_version']
            end
            
            def beta
              @properties['beta']
            end
            
            def capabilities
              @properties['capabilities']
            end
            
            def date_created
              @properties['date_created']
            end
            
            def date_updated
              @properties['date_updated']
            end
            
            def friendly_name
              @properties['friendly_name']
            end
            
            def phone_number
              @properties['phone_number']
            end
            
            def sid
              @properties['sid']
            end
            
            def sms_application_sid
              @properties['sms_application_sid']
            end
            
            def sms_fallback_method
              @properties['sms_fallback_method']
            end
            
            def sms_fallback_url
              @properties['sms_fallback_url']
            end
            
            def sms_method
              @properties['sms_method']
            end
            
            def sms_url
              @properties['sms_url']
            end
            
            def status_callback
              @properties['status_callback']
            end
            
            def status_callback_method
              @properties['status_callback_method']
            end
            
            def uri
              @properties['uri']
            end
            
            def voice_application_sid
              @properties['voice_application_sid']
            end
            
            def voice_caller_id_lookup
              @properties['voice_caller_id_lookup']
            end
            
            def voice_fallback_method
              @properties['voice_fallback_method']
            end
            
            def voice_fallback_url
              @properties['voice_fallback_url']
            end
            
            def voice_method
              @properties['voice_method']
            end
            
            def voice_url
              @properties['voice_url']
            end
            
            ##
            # Update the IncomingPhoneNumberInstance
            # @param [String] account_sid The unique id of the Account to which you wish to
            #   transfer this phnoe number
            # @param [String] api_version Calls to this phone number will start a new TwiML
            #   session with this API version.
            # @param [String] friendly_name A human readable descriptive text for this
            #   resource, up to 64 characters long. By default, the `FriendlyName` is a nicely
            #   formatted version of the phone number.
            # @param [String] sms_application_sid The 34 character sid of the application
            #   Twilio should use to handle SMSs sent to this number. If a `SmsApplicationSid`
            #   is present, Twilio will ignore all of the SMS urls above and use those set on
            #   the application.
            # @param [String] sms_fallback_method The HTTP method Twilio will use when
            #   requesting the above URL. Either `GET` or `POST`.
            # @param [String] sms_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML from `SmsUrl`.
            # @param [String] sms_method The HTTP method Twilio will use when making requests
            #   to the `SmsUrl`. Either `GET` or `POST`.
            # @param [String] sms_url The URL Twilio will request when receiving an incoming
            #   SMS message to this number.
            # @param [String] status_callback The URL that Twilio will request to pass status
            #   parameters (such as call ended) to your application.
            # @param [String] status_callback_method The HTTP method Twilio will use to make
            #   requests to the `StatusCallback` URL. Either `GET` or `POST`.
            # @param [String] voice_application_sid The 34 character sid of the application
            #   Twilio should use to handle phone calls to this number. If a
            #   `VoiceApplicationSid` is present, Twilio will ignore all of the voice urls above
            #   and use those set on the application. Setting a `VoiceApplicationSid` will
            #   automatically delete your `TrunkSid` and vice versa.
            # @param [Boolean] voice_caller_id_lookup Look up the caller's caller-ID name from
            #   the CNAM database ($0.01 per look up). Either `true` or `false`.
            # @param [String] voice_fallback_method The HTTP method Twilio will use when
            #   requesting the `VoiceFallbackUrl`. Either `GET` or `POST`.
            # @param [String] voice_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML requested by `Url`.
            # @param [String] voice_method The HTTP method Twilio will use when requesting the
            #   above `Url`. Either `GET` or `POST`.
            # @param [String] voice_url The URL Twilio will request when this phone number
            #   receives a call. The VoiceURL will  no longer be used if a `VoiceApplicationSid`
            #   or a `TrunkSid` is set.
            
            # @return [IncomingPhoneNumberInstance] Updated IncomingPhoneNumberInstance
            def update(account_sid: nil, api_version: nil, friendly_name: nil, sms_application_sid: nil, sms_fallback_method: nil, sms_fallback_url: nil, sms_method: nil, sms_url: nil, status_callback: nil, status_callback_method: nil, voice_application_sid: nil, voice_caller_id_lookup: nil, voice_fallback_method: nil, voice_fallback_url: nil, voice_method: nil, voice_url: nil)
              @context.update(
                  api_version: api_version,
                  friendly_name: friendly_name,
                  sms_application_sid: sms_application_sid,
                  sms_fallback_method: sms_fallback_method,
                  sms_fallback_url: sms_fallback_url,
                  sms_method: sms_method,
                  sms_url: sms_url,
                  status_callback: status_callback,
                  status_callback_method: status_callback_method,
                  voice_application_sid: voice_application_sid,
                  voice_caller_id_lookup: voice_caller_id_lookup,
                  voice_fallback_method: voice_fallback_method,
                  voice_fallback_url: voice_fallback_url,
                  voice_method: voice_method,
                  voice_url: voice_url,
              )
            end
            
            ##
            # Fetch a IncomingPhoneNumberInstance
            # @return [IncomingPhoneNumberInstance] Fetched IncomingPhoneNumberInstance
            def fetch
              @context.fetch()
            end
            
            ##
            # Deletes the IncomingPhoneNumberInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @context.delete()
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.IncomingPhoneNumberInstance #{context}>"
            end
          end
        end
      end
    end
  end
end