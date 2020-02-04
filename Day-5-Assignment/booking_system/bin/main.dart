import 'package:booking_system/handler.dart';

void main(List<String> arguments) {
  Handler hander = Handler();
  hander.begin();
  hander.showBookings();
}