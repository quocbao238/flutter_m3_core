import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

PluginBase createPlugin() => _MyAwesomeLint();

/// A plugin class is used to list all the assists/lints defined by a plugin.
class _MyAwesomeLint extends PluginBase {
  /// We list all the custom warnings/infos/errors
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        MyCustomLintCode(),
      ];
}

class MyCustomLintCode extends DartLintRule {
  MyCustomLintCode() : super(code: _code);

  static const _code = LintCode(
    name: 'my_custom_lint_code',
    problemMessage: 'This is the description of our custom lint',
  );

  @override
  void run(CustomLintResolver resolver, ErrorReporter reporter,
      CustomLintContext context) {
    context.registry.addVariableDeclaration((node) {
      reporter.reportErrorForNode(code, node);
    });
  }
}
