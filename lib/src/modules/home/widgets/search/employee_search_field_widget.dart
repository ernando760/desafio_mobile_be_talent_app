import 'package:desafio_mobile_be_talent_app/src/extensions/context_theme_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controllers/home_controller.dart';

class EmployeeSearchFieldWidget extends StatefulWidget {
  const EmployeeSearchFieldWidget({super.key});

  @override
  State<EmployeeSearchFieldWidget> createState() =>
      _EmployeeSearchFieldWidgetState();
}

class _EmployeeSearchFieldWidgetState extends State<EmployeeSearchFieldWidget> {
  late final TextEditingController _searchController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: "");
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = context.read<HomeController>();
    return TextField(
      focusNode: _focusNode,
      controller: _searchController,
      onChanged: homeController.searchEmployeeInfo,
      onTapOutside: (_) => _focusNode.unfocus(),
      onEditingComplete: () => _focusNode.unfocus(),
      decoration: InputDecoration(
          prefixIconConstraints:
              const BoxConstraints(minHeight: 24, minWidth: 24),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                .copyWith(right: 8),
            child: SvgPicture.asset(
              "assets/images/icons/search.svg",
              colorFilter: ColorFilter.mode(
                context.black,
                BlendMode.srcIn,
              ),
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
          ),
          hintText: "Pesquisar",
          hintStyle: TextStyle(
              fontSize: context.regular16,
              fontWeight: FontWeight.w400,
              color: context.black),
          fillColor: context.white,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.gray10),
              borderRadius: const BorderRadius.all(Radius.circular(100))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.gray10),
              borderRadius: const BorderRadius.all(Radius.circular(100))),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: context.gray10),
              borderRadius: const BorderRadius.all(Radius.circular(100)))),
    );
  }
}
