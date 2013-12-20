{
	"name" => "VALIDATION_ERROR",
	"details" => [
		{
			"field" => "number",
			"issue" => "Value is invalid"
		},
		{
			"field" => "expire_year",
			"issue" => "Must be numeric (YYYY)"
		},
		{
			"field" => "type",
			"issue" => "Value is invalid (must be visa, mastercard, amex, discover, or maestro)"
		}
	],

	"message" => "Invalid request - see details",
	"information_link" => "https://developer.paypal.com/docs/api/#VALIDATION_ERROR",
	"debug_id" => "ce2f1aa148769"
}





	@error=nil,
	@number="xxxxxxxxxxxx2884",
	@type="visa",
	@expire_month=11,
	@expire_year=2015,
	@cvv2="428",
	@first_name="Peter",
	@last_name="Andersson",
	@billing_address={
		@error=nil,
		@line1="Mackmyra byväg 36",
		@city="Valbo",
		@state="OH",
		@postal_code="81832",
		@country_code="SE"
	},
	@request_id="f05d8fa1-38f9-4122-b72d-5b06c10875a9",
	@header={},
	@id="CARD-2X189563M3443135VKKDDW6Y",
	@state="ok",
	@valid_until="2015-12-01T00:00:00Z",
	@logger=
	@log_dest=#<File:/Library/WebServer/Documents/PROJECTS/Remember/log/development.log>,
	@log=#<Logger:0x007fae72c6d400
	@progname=nil,
	@level=0,
	@default_formatter=#<Logger::Formatter:0x007fae72c6d360 @datetime_format=nil>,
	@formatter=#<Logger::SimpleFormatter:0x007fae72c6d1a8
	@datetime_format=nil>,
	@logdev=#<Logger::LogDevice:0x007fae72c6d2e8
	@shift_size=nil,
	@shift_age=nil,
	@filename=nil,
	@dev=#<File:/Library/WebServer/Documents/PROJECTS/Remember/log/development.log>,
	@mutex=#<Logger::LogDevice::LogDeviceMutex:0x007fae72c6d2c0
	@mon_owner=nil,
	@mon_count=0,
	@mon_mutex=#<Mutex:0x007fae72c6d1d0>>>>>>,

@links=[
	#<PayPal::SDK::REST::DataTypes::Links:0x007fae7988f3b8 @error=nil,
	# @href="https://api.sandbox.paypal.com/v1/vault/credit-credit_card/CARD-2X189563M3443135VKKDDW6Y",
	# @rel="self", @method="GET">,
	# #<PayPal::SDK::REST::DataTypes::Links:0x007fae7988edc8 @error=nil,
	# @href="https://api.sandbox.paypal.com/v1/vault/credit-credit_card/CARD-2X189563M3443135VKKDDW6Y",
	# @rel="delete", @method="DELETE">,
	# #<PayPal::SDK::REST::DataTypes::Links:0x007fae7988e940 @error=nil,
	# @href="https://api.sandbox.paypal.com/v1/vault/credit-credit_card/CARD-2X189563M3443135VKKDDW6Y",
	# @rel="patch",
	# @method="PATCH">]>