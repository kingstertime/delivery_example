import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:superdostavka/data/action/action_dto.dart';
import 'package:superdostavka/data/api_key/api_key_dto.dart';
import 'package:superdostavka/data/catalog/catalog_dto.dart';
import 'package:superdostavka/data/code/code_dto.dart';
import 'package:superdostavka/data/config/config_dto.dart';
import 'package:superdostavka/data/order/order_body.dart';
import 'package:superdostavka/data/order/order_response_dto.dart';
import 'package:superdostavka/data/user_info/user_info_dto.dart';
import 'package:superdostavka/data/validate_order/validate_order_body.dart';
import 'package:superdostavka/data/validate_order/validate_order_response_dto.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/mobile_api/v2/catalog?city_id={city_id}')
  Future<CatalogDto> getCatalog({
    @Path('city_id') int? cityId,
  });

  @GET('/mobile_api/v2/config')
  Future<ConfigDto> getConfig();

  @GET('/mobile_api/actions')
  Future<ActionResponseDto> getActions();

  @GET('/mobile_api/register_mobile_user?phone={phone}')
  Future<CodeDto> sendCode(@Path('phone') int phone);

  @GET(
      '/mobile_api/generate_mobile_api_key?phone={phone}&code={code}&city_id={city_id}')
  Future<ApiKeyDto> generateApiKey(@Path('phone') int phone,
      @Path('code') int code, @Path('city_id') int id);

  @GET('/mobile_api/v2/user_info?city_id={city_id}')
  Future<UserInfoDto> getUserInfo(
    @Path('city_id') int? cityId,
  );

  @POST('/mobile_api/v2/make_order')
  Future<OrderResponseDto> sendOrder(@Body() OrderBody body);

  @POST('/mobile_api/v2/order_validate')
  Future<ValidateOrderResponseDto> sendValidateOrder(@Body() ValidateOrderBody body);
}
