require 'active_model_serializers/register_jsonapi_renderer'
#allows me to create json serializers when generating serializers
ActiveModelSerializers.config.adapter = :json_api