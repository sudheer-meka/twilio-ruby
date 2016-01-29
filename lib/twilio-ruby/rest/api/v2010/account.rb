##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountList < ListResource
          ##
          # Initialize the AccountList
          # @param [Version] version Version that contains the resource
          
          # @return [AccountList] AccountList
          def initialize(version)
            super(version)
            
            # Path Solution
            @solution = {}
            @uri = "/Accounts.json"
          end
          
          ##
          # Retrieve a single page of AccountInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name A human readable description of the account to
          #   create, defaults to `SubAccount Created at {YYYY-MM-DD HH:MM meridian}`
          
          # @return [AccountInstance] Newly created AccountInstance
          def create(friendly_name: nil)
            data = {
                'FriendlyName' => friendly_name,
            }
            
            payload = @version.create(
                'POST',
                @uri,
                data: data
            )
            
            return AccountInstance.new(
                @version,
                payload,
            )
          end
          
          ##
          # Lists AccountInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] friendly_name Filter accounts where the friendly name exactly
          #   matches the desired FriendlyName
          # @param [account.Status] status Only show accounts with the given Status
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #                   guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
          #  the default value of 50 records.  If no page_size is                      defined
          #  but a limit is defined, stream() will attempt to read                      the
          #  limit with the most efficient page size,                      i.e. min(limit, 1000)
          
          # @return [Array] Array of up to limit results
          def list(friendly_name: nil, status: nil, limit: nil, page_size: nil)
            self.stream(
                friendly_name: friendly_name,
                status: status,
                limit: limit,
                page_size: page_size
            ).entries
          end
          
          ##
          # Streams AccountInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] friendly_name Filter accounts where the friendly name exactly
          #   matches the desired FriendlyName
          # @param [account.Status] status Only show accounts with the given Status
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to                      read the
          #  limit with the most efficient page size,                       i.e. min(limit, 1000)
          
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(friendly_name: nil, status: nil, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)
            
            page = self.page(
                friendly_name: friendly_name,
                status: status,
                page_size: limits['page_size'],
            )
            
            @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
          end
          
          ##
          # When passed a block, yields AccountInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] friendly_name Filter accounts where the friendly name exactly
          #   matches the desired FriendlyName
          # @param [account.Status] status Only show accounts with the given Status
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
          # Retrieve a single page of AccountInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name Filter accounts where the friendly name exactly
          #   matches the desired FriendlyName
          # @param [account.Status] status Only show accounts with the given Status
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          
          # @return [Page] Page of AccountInstance
          def page(friendly_name: nil, status: nil, page_token: nil, page_number: nil, page_size: nil)
            params = {
                'FriendlyName' => friendly_name,
                'Status' => status,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            }
            response = @version.page(
                'GET',
                @uri,
                params
            )
            return AccountPage.new(@version, response, @solution)
          end
          
          ##
          # Constructs a AccountContext
          # @param [String] sid The Account Sid that uniquely identifies the account to
          #   fetch
          
          # @return [AccountContext] AccountContext
          def get(sid)
            AccountContext.new(
                @version,
                sid: sid,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Api.V2010.AccountList>'
          end
        end
      
        class AccountPage < Page
          ##
          # Initialize the AccountPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          
          # @return [AccountPage] AccountPage
          def initialize(version, response, solution)
            super(version, response)
            
            # Path Solution
            @solution = solution
          end
          
          ##
          # Build an instance of AccountInstance
          # @param [Hash] payload Payload response from the API
          
          # @return [AccountInstance] AccountInstance
          def get_instance(payload)
            return AccountInstance.new(
                @version,
                payload,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Api.V2010.AccountPage>'
          end
        end
      
        class AccountContext < InstanceContext
          ##
          # Initialize the AccountContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The Account Sid that uniquely identifies the account to
          #   fetch
          
          # @return [AccountContext] AccountContext
          def initialize(version, sid)
            super(version)
            
            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/Accounts/#{@solution[:sid]}.json"
            
            # Dependents
            @addresses = nil
            @applications = nil
            @authorized_connect_apps = nil
            @available_phone_numbers = nil
            @calls = nil
            @conferences = nil
            @connect_apps = nil
            @incoming_phone_numbers = nil
            @messages = nil
            @notifications = nil
            @outgoing_caller_ids = nil
            @queues = nil
            @recordings = nil
            @sandbox = nil
            @sip = nil
            @sms = nil
            @tokens = nil
            @transcriptions = nil
            @usage = nil
            @validation_requests = nil
          end
          
          ##
          # Fetch a AccountInstance
          # @return [AccountInstance] Fetched AccountInstance
          def fetch
            params = {}
            
            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )
            
            return AccountInstance.new(
                @version,
                payload,
                sid: @solution['sid'],
            )
          end
          
          ##
          # Update the AccountInstance
          # @param [String] friendly_name Update the human-readable description of this
          #   Account
          # @param [account.Status] status Alter the status of this account with a given
          #   Status
          
          # @return [AccountInstance] Updated AccountInstance
          def update(friendly_name: nil, status: nil)
            data = {
                'FriendlyName' => friendly_name,
                'Status' => status,
            }
            
            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )
            
            return AccountInstance.new(
                @version,
                payload,
                sid: @solution['sid'],
            )
          end
          
          ##
          # Access the addresses
          # @return [AddressList] AddressList
          def addresses(sid=:unset)
            if sid != :unset
              return AddressContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @addresses
              @addresses = AddressList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @addresses
          end
          
          ##
          # Access the applications
          # @return [ApplicationList] ApplicationList
          def applications(sid=:unset)
            if sid != :unset
              return ApplicationContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @applications
              @applications = ApplicationList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @applications
          end
          
          ##
          # Access the authorized_connect_apps
          # @return [AuthorizedConnectAppList] AuthorizedConnectAppList
          def authorized_connect_apps(connect_app_sid=:unset)
            if connect_app_sid != :unset
              return AuthorizedConnectAppContext.new(
                  @version,
                  @solution[:sid],
                  connect_app_sid,
              )
            end
            
            unless @authorized_connect_apps
              @authorized_connect_apps = AuthorizedConnectAppList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @authorized_connect_apps
          end
          
          ##
          # Access the available_phone_numbers
          # @return [AvailablePhoneNumberCountryList] AvailablePhoneNumberCountryList
          def available_phone_numbers(country_code=:unset)
            if country_code != :unset
              return AvailablePhoneNumberCountryContext.new(
                  @version,
                  @solution[:sid],
                  country_code,
              )
            end
            
            unless @available_phone_numbers
              @available_phone_numbers = AvailablePhoneNumberCountryList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @available_phone_numbers
          end
          
          ##
          # Access the calls
          # @return [CallList] CallList
          def calls(sid=:unset)
            if sid != :unset
              return CallContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @calls
              @calls = CallList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @calls
          end
          
          ##
          # Access the conferences
          # @return [ConferenceList] ConferenceList
          def conferences(sid=:unset)
            if sid != :unset
              return ConferenceContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @conferences
              @conferences = ConferenceList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @conferences
          end
          
          ##
          # Access the connect_apps
          # @return [ConnectAppList] ConnectAppList
          def connect_apps(sid=:unset)
            if sid != :unset
              return ConnectAppContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @connect_apps
              @connect_apps = ConnectAppList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @connect_apps
          end
          
          ##
          # Access the incoming_phone_numbers
          # @return [IncomingPhoneNumberList] IncomingPhoneNumberList
          def incoming_phone_numbers(sid=:unset)
            if sid != :unset
              return IncomingPhoneNumberContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @incoming_phone_numbers
              @incoming_phone_numbers = IncomingPhoneNumberList.new(
                  @version,
                  owner_account_sid: @solution[:sid],
              )
            end
            
            @incoming_phone_numbers
          end
          
          ##
          # Access the messages
          # @return [MessageList] MessageList
          def messages(sid=:unset)
            if sid != :unset
              return MessageContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @messages
              @messages = MessageList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @messages
          end
          
          ##
          # Access the notifications
          # @return [NotificationList] NotificationList
          def notifications(sid=:unset)
            if sid != :unset
              return NotificationContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @notifications
              @notifications = NotificationList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @notifications
          end
          
          ##
          # Access the outgoing_caller_ids
          # @return [OutgoingCallerIdList] OutgoingCallerIdList
          def outgoing_caller_ids(sid=:unset)
            if sid != :unset
              return OutgoingCallerIdContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @outgoing_caller_ids
              @outgoing_caller_ids = OutgoingCallerIdList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @outgoing_caller_ids
          end
          
          ##
          # Access the queues
          # @return [QueueList] QueueList
          def queues(sid=:unset)
            if sid != :unset
              return QueueContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @queues
              @queues = QueueList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @queues
          end
          
          ##
          # Access the recordings
          # @return [RecordingList] RecordingList
          def recordings(sid=:unset)
            if sid != :unset
              return RecordingContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @recordings
              @recordings = RecordingList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @recordings
          end
          
          ##
          # Access the sandbox
          # @return [SandboxList] SandboxList
          def sandbox
            return SandboxContext.new(
                @version,
                @solution[:sid],
            )
          end
          
          ##
          # Access the sip
          # @return [SipList] SipList
          def sip
            unless @sip
              @sip = SipList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @sip
          end
          
          ##
          # Access the sms
          # @return [SmsList] SmsList
          def sms
            unless @sms
              @sms = SmsList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @sms
          end
          
          ##
          # Access the tokens
          # @return [TokenList] TokenList
          def tokens
            unless @tokens
              @tokens = TokenList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @tokens
          end
          
          ##
          # Access the transcriptions
          # @return [TranscriptionList] TranscriptionList
          def transcriptions(sid=:unset)
            if sid != :unset
              return TranscriptionContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @transcriptions
              @transcriptions = TranscriptionList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @transcriptions
          end
          
          ##
          # Access the usage
          # @return [UsageList] UsageList
          def usage
            unless @usage
              @usage = UsageList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @usage
          end
          
          ##
          # Access the validation_requests
          # @return [ValidationRequestList] ValidationRequestList
          def validation_requests
            unless @validation_requests
              @validation_requests = ValidationRequestList.new(
                  @version,
                  account_sid: @solution[:sid],
              )
            end
            
            @validation_requests
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Api.V2010.AccountContext #{context}>"
          end
        end
      
        class AccountInstance < InstanceResource
          ##
          # Initialize the AccountInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The Account Sid that uniquely identifies the account to
          #   fetch
          
          # @return [AccountInstance] AccountInstance
          def initialize(version, payload, sid: nil)
            super(version)
            
            # Marshaled Properties
            @properties = {
                'auth_token' => payload['auth_token'],
                'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                'friendly_name' => payload['friendly_name'],
                'owner_account_sid' => payload['owner_account_sid'],
                'sid' => payload['sid'],
                'status' => payload['status'],
                'subresource_uris' => payload['subresource_uris'],
                'type' => payload['type'],
                'uri' => payload['uri'],
            }
            
            # Context
            @instance_context = nil
            @params = {
                'sid' => sid || @properties['sid'],
            }
          end
          
          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @param [Version] version Version that contains the resource
          
          # @return [AccountContext] AccountContext for this AccountInstance
          def context
            unless @instance_context
              @instance_context = AccountContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end
          
          def auth_token
            @properties['auth_token']
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
          
          def owner_account_sid
            @properties['owner_account_sid']
          end
          
          def sid
            @properties['sid']
          end
          
          def status
            @properties['status']
          end
          
          def subresource_uris
            @properties['subresource_uris']
          end
          
          def type
            @properties['type']
          end
          
          def uri
            @properties['uri']
          end
          
          ##
          # Fetch a AccountInstance
          # @return [AccountInstance] Fetched AccountInstance
          def fetch
            @context.fetch()
          end
          
          ##
          # Update the AccountInstance
          # @param [String] friendly_name Update the human-readable description of this
          #   Account
          # @param [account.Status] status Alter the status of this account with a given
          #   Status
          
          # @return [AccountInstance] Updated AccountInstance
          def update(friendly_name: nil, status: nil)
            @context.update(
                status: status,
            )
          end
          
          ##
          # Access the addresses
          # @return [addresses] addresses
          def addresses
            @context.addresses
          end
          
          ##
          # Access the applications
          # @return [applications] applications
          def applications
            @context.applications
          end
          
          ##
          # Access the authorized_connect_apps
          # @return [authorized_connect_apps] authorized_connect_apps
          def authorized_connect_apps
            @context.authorized_connect_apps
          end
          
          ##
          # Access the available_phone_numbers
          # @return [available_phone_numbers] available_phone_numbers
          def available_phone_numbers
            @context.available_phone_numbers
          end
          
          ##
          # Access the calls
          # @return [calls] calls
          def calls
            @context.calls
          end
          
          ##
          # Access the conferences
          # @return [conferences] conferences
          def conferences
            @context.conferences
          end
          
          ##
          # Access the connect_apps
          # @return [connect_apps] connect_apps
          def connect_apps
            @context.connect_apps
          end
          
          ##
          # Access the incoming_phone_numbers
          # @return [incoming_phone_numbers] incoming_phone_numbers
          def incoming_phone_numbers
            @context.incoming_phone_numbers
          end
          
          ##
          # Access the messages
          # @return [messages] messages
          def messages
            @context.messages
          end
          
          ##
          # Access the notifications
          # @return [notifications] notifications
          def notifications
            @context.notifications
          end
          
          ##
          # Access the outgoing_caller_ids
          # @return [outgoing_caller_ids] outgoing_caller_ids
          def outgoing_caller_ids
            @context.outgoing_caller_ids
          end
          
          ##
          # Access the queues
          # @return [queues] queues
          def queues
            @context.queues
          end
          
          ##
          # Access the recordings
          # @return [recordings] recordings
          def recordings
            @context.recordings
          end
          
          ##
          # Access the sandbox
          # @return [sandbox] sandbox
          def sandbox
            @context.sandbox
          end
          
          ##
          # Access the sip
          # @return [sip] sip
          def sip
            @context.sip
          end
          
          ##
          # Access the sms
          # @return [sms] sms
          def sms
            @context.sms
          end
          
          ##
          # Access the tokens
          # @return [tokens] tokens
          def tokens
            @context.tokens
          end
          
          ##
          # Access the transcriptions
          # @return [transcriptions] transcriptions
          def transcriptions
            @context.transcriptions
          end
          
          ##
          # Access the usage
          # @return [usage] usage
          def usage
            @context.usage
          end
          
          ##
          # Access the validation_requests
          # @return [validation_requests] validation_requests
          def validation_requests
            @context.validation_requests
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Api.V2010.AccountInstance #{context}>"
          end
        end
      end
    end
  end
end