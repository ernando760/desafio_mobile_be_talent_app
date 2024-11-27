import 'package:desafio_mobile_be_talent_app/src/extensions/context_theme_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/home_controller.dart';
import '../state/home_state.dart';
import '../widgets/app_bar/my_app_bar_widget.dart';
import '../widgets/search/employee_search_field_widget.dart';
import '../widgets/table/employee_table_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) async => await Modular.get<HomeController>().getAllEmployees());
  }

  @override
  Widget build(BuildContext context) {
    final homeController = context.watch<HomeController>();
    final sizeOf = MediaQuery.sizeOf(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: context.white,
        systemNavigationBarColor: context.black,
      ),
      child: Scaffold(
          appBar: const MyAppBarWidget(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 24),
                  Text("Funcionários",
                      style: TextStyle(
                        color: context.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  // Search
                  const EmployeeSearchFieldWidget(),
                  const SizedBox(
                    height: 24,
                  ),
                  Builder(
                    builder: (_) {
                      final state = homeController.state;
                      return switch (state) {
                        InitialHomeState() || LoadingHomeState() => SizedBox(
                            height: sizeOf.height * .5,
                            child: Center(
                                child: CircularProgressIndicator(
                                    color: context.primary))),
                        LoadedHomeState(
                          :final employees,
                          :final filteredEmployees
                        ) =>
                          SizedBox(
                            height: sizeOf.height,
                            child: EmployeeTableWidget(
                              employees: filteredEmployees.isEmpty
                                  ? employees
                                  : filteredEmployees,
                            ),
                          ),
                        FailureHomeState(:final messageError) => SizedBox(
                            height: sizeOf.height * .5,
                            child: Center(
                              child: Text(
                                messageError,
                                style: TextStyle(
                                  fontSize: context.regular16,
                                  color: context.black,
                                ),
                              ),
                            ),
                          ),
                      };
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

// CustomScrollView(
//               slivers: [
//                 SliverList(
//                     delegate: SliverChildListDelegate([
//                   const SizedBox(height: 24),
//                   Text("Funcionários",
//                       style: TextStyle(
//                         color: context.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                       )),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   // Search
//                   const EmployeeSearchFieldWidget(),
//                   const SizedBox(
//                     height: 24,
//                   ),
//                 ])),
//                 SliverToBoxAdapter(
//                   child: LayoutBuilder(
//                     builder: (_, __) {
//                       final state = homeController.state;
//                       return SizedBox(
//                         height: MediaQuery.sizeOf(context).height,
//                         child: switch (state) {
//                           InitialHomeState() ||
//                           LoadingHomeState() =>
//                             const Center(
//                               child: CircularProgressIndicator(),
//                             ),
//                           LoadedHomeState(
//                             :final employees,
//                             :final filteredEmployees
//                           ) =>
//                             EmployeeTableWidget(
//                               employees: filteredEmployees.isEmpty
//                                   ? employees
//                                   : filteredEmployees,
//                             ),
//                           FailureHomeState(:final messageError) => Center(
//                               child: Text(messageError),
//                             ),
//                         },
//                       );
//                     },
//                   ),
//                 ),
//                 SliverList(
//                     delegate: SliverChildListDelegate([
//                   const SizedBox(
//                     height: 30,
//                   ),
//                 ]))
//               ],
//             )

