import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/core/dependensies/root_dependency_container.dart';
import 'package:lesson69/core/dependensies/root_dependency_factory.dart';


final dependencyProvider = Provider<RootDependencyContainer>((ref) {
  return RootDependencyFactory().create();
});