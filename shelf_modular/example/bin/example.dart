import 'package:example/src/app_module.dart';
import 'package:hotreloader/hotreloader.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_modular/shelf_modular.dart';

void main(List<String> args) async {
  await HotReloader.create(
    onBeforeReload: (ctx) => Modular.reassemble(),
    onAfterReload: (ctx) => print(ctx.reloadReports),
  );

  var server = await io.serve(Modular.call(module: AppModule()), '0.0.0.0', 4000);
  print('Serving at http://${server.address.host}:${server.port}');
}
