import 'package:logger/logger.dart';

class LoggerService {
  // Singleton pattern
  static final LoggerService _instance = LoggerService._internal();
  factory LoggerService() => _instance;
  LoggerService._internal();

  // Logger object
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // stack trace-il ethra methods show cheyyum
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      // ignore: deprecated_member_use
      printTime: true,
    ),
  );

  // Shortcut methods
  void v(dynamic message) => logger.v(message);
  void d(dynamic message) => logger.d(message);
  void i(dynamic message) => logger.i(message);
  void w(dynamic message) => logger.w(message);
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      logger.e(message, error: error, stackTrace: stackTrace);
  void wtf(dynamic message) => logger.wtf(message);
}
