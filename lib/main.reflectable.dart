// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'package:json_annotation/src/json_serializable.dart' as prefix3;
import 'package:silverliningsreddit/src/dtos/auth_response_dto.dart' as prefix1;
import 'package:silverliningsreddit/src/helpers/ignore.dart' as prefix4;
import 'package:silverliningsreddit/src/helpers/reflector.dart' as prefix0;
import 'package:silverliningsreddit/src/models/user.dart' as prefix2;

// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const
// ignore_for_file: implementation_imports

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.Reflector(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'AuthResponseDto',
            r'.AuthResponseDto',
            7,
            0,
            const prefix0.Reflector(),
            const <int>[0, 1, 2, 9, 16, 17],
            const <int>[18, 19, 20, 21, 22, 9, 10, 11, 12, 13, 14, 15],
            const <int>[],
            -1,
            {},
            {},
            {
              r'': (bool b) => ({accessToken, expiresIn, refreshToken}) => b
                  ? prefix1.AuthResponseDto(
                      accessToken: accessToken,
                      expiresIn: expiresIn,
                      refreshToken: refreshToken)
                  : null,
              r'fromJson': (bool b) =>
                  (json) => b ? prefix1.AuthResponseDto.fromJson(json) : null
            },
            0,
            0,
            const <int>[],
            const <Object>[prefix0.reflector, const prefix3.JsonSerializable()],
            null),
        r.NonGenericClassMirrorImpl(
            r'User',
            r'.User',
            7,
            1,
            const prefix0.Reflector(),
            const <int>[3, 4, 5, 6, 7, 8, 23, 30, 31],
            const <int>[18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29],
            const <int>[],
            -1,
            {},
            {},
            {
              r'': (bool b) =>
                  (id, userName, password, firstName, lastName, email) => b
                      ? prefix2.User(
                          id, userName, password, firstName, lastName, email)
                      : null,
              r'fromJson': (bool b) =>
                  (json) => b ? prefix2.User.fromJson(json) : null
            },
            1,
            1,
            const <int>[],
            const <Object>[prefix0.reflector, const prefix3.JsonSerializable()],
            null)
      ],
      <m.DeclarationMirror>[
        r.VariableMirrorImpl(r'accessToken', 32773, 0,
            const prefix0.Reflector(), -1, 2, 2, const <int>[], const []),
        r.VariableMirrorImpl(r'expiresIn', 32773, 0, const prefix0.Reflector(),
            -1, 3, 3, const <int>[], const []),
        r.VariableMirrorImpl(r'refreshToken', 32773, 0,
            const prefix0.Reflector(), -1, 2, 2, const <int>[], const []),
        r.VariableMirrorImpl(r'id', 33797, 1, const prefix0.Reflector(), -1, 3,
            3, const <int>[], const []),
        r.VariableMirrorImpl(r'userName', 33797, 1, const prefix0.Reflector(),
            -1, 2, 2, const <int>[], const []),
        r.VariableMirrorImpl(r'password', 33797, 1, const prefix0.Reflector(),
            -1, 2, 2, const <int>[], const []),
        r.VariableMirrorImpl(r'firstName', 33797, 1, const prefix0.Reflector(),
            -1, 2, 2, const <int>[], const []),
        r.VariableMirrorImpl(r'lastName', 33797, 1, const prefix0.Reflector(),
            -1, 2, 2, const <int>[], const []),
        r.VariableMirrorImpl(r'email', 33797, 1, const prefix0.Reflector(), -1,
            2, 2, const <int>[], const []),
        r.MethodMirrorImpl(r'toJson', 4325378, 0, -1, 4, 5, null, const <int>[],
            const prefix0.Reflector(), const []),
        r.ImplicitGetterMirrorImpl(const prefix0.Reflector(), 0, 10),
        r.ImplicitSetterMirrorImpl(const prefix0.Reflector(), 0, 11),
        r.ImplicitGetterMirrorImpl(const prefix0.Reflector(), 1, 12),
        r.ImplicitSetterMirrorImpl(const prefix0.Reflector(), 1, 13),
        r.ImplicitGetterMirrorImpl(const prefix0.Reflector(), 2, 14),
        r.ImplicitSetterMirrorImpl(const prefix0.Reflector(), 2, 15),
        r.MethodMirrorImpl(r'', 0, 0, -1, 0, 0, const <int>[],
            const <int>[0, 1, 2], const prefix0.Reflector(), const []),
        r.MethodMirrorImpl(r'fromJson', 1, 0, -1, 0, 0, const <int>[],
            const <int>[3], const prefix0.Reflector(), const []),
        r.MethodMirrorImpl(r'==', 131074, null, -1, 6, 6, const <int>[],
            const <int>[7], const prefix0.Reflector(), const []),
        r.MethodMirrorImpl(r'toString', 131074, null, -1, 2, 2, const <int>[],
            const <int>[], const prefix0.Reflector(), const []),
        r.MethodMirrorImpl(r'noSuchMethod', 65538, null, null, null, null,
            const <int>[], const <int>[8], const prefix0.Reflector(), const []),
        r.MethodMirrorImpl(r'hashCode', 131075, null, -1, 3, 3, const <int>[],
            const <int>[], const prefix0.Reflector(), const []),
        r.MethodMirrorImpl(r'runtimeType', 131075, null, -1, 7, 7,
            const <int>[], const <int>[], const prefix0.Reflector(), const []),
        r.MethodMirrorImpl(r'toJson', 4325378, 1, -1, 4, 5, null, const <int>[],
            const prefix0.Reflector(), const <Object>[prefix4.ignore]),
        r.ImplicitGetterMirrorImpl(const prefix0.Reflector(), 3, 24),
        r.ImplicitGetterMirrorImpl(const prefix0.Reflector(), 4, 25),
        r.ImplicitGetterMirrorImpl(const prefix0.Reflector(), 5, 26),
        r.ImplicitGetterMirrorImpl(const prefix0.Reflector(), 6, 27),
        r.ImplicitGetterMirrorImpl(const prefix0.Reflector(), 7, 28),
        r.ImplicitGetterMirrorImpl(const prefix0.Reflector(), 8, 29),
        r.MethodMirrorImpl(
            r'',
            0,
            1,
            -1,
            1,
            1,
            const <int>[],
            const <int>[9, 10, 11, 12, 13, 14],
            const prefix0.Reflector(),
            const []),
        r.MethodMirrorImpl(
            r'fromJson',
            1,
            1,
            -1,
            1,
            1,
            const <int>[],
            const <int>[15],
            const prefix0.Reflector(),
            const <Object>[prefix4.ignore])
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r'accessToken',
            45062,
            16,
            const prefix0.Reflector(),
            -1,
            2,
            2,
            const <int>[],
            const [],
            null,
            #accessToken),
        r.ParameterMirrorImpl(
            r'expiresIn',
            45062,
            16,
            const prefix0.Reflector(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            #expiresIn),
        r.ParameterMirrorImpl(
            r'refreshToken',
            45062,
            16,
            const prefix0.Reflector(),
            -1,
            2,
            2,
            const <int>[],
            const [],
            null,
            #refreshToken),
        r.ParameterMirrorImpl(r'json', 16390, 17, const prefix0.Reflector(),
            null, null, null, const <int>[], const [], null, null),
        r.ParameterMirrorImpl(
            r'_accessToken',
            32870,
            11,
            const prefix0.Reflector(),
            -1,
            2,
            2,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_expiresIn',
            32870,
            13,
            const prefix0.Reflector(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_refreshToken',
            32870,
            15,
            const prefix0.Reflector(),
            -1,
            2,
            2,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(r'other', 32774, 18, const prefix0.Reflector(),
            -1, 8, 8, const <int>[], const [], null, null),
        r.ParameterMirrorImpl(
            r'invocation',
            32774,
            20,
            const prefix0.Reflector(),
            -1,
            9,
            9,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(r'id', 32774, 30, const prefix0.Reflector(), -1,
            3, 3, const <int>[], const [], null, null),
        r.ParameterMirrorImpl(r'userName', 32774, 30, const prefix0.Reflector(),
            -1, 2, 2, const <int>[], const [], null, null),
        r.ParameterMirrorImpl(r'password', 32774, 30, const prefix0.Reflector(),
            -1, 2, 2, const <int>[], const [], null, null),
        r.ParameterMirrorImpl(
            r'firstName',
            32774,
            30,
            const prefix0.Reflector(),
            -1,
            2,
            2,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(r'lastName', 32774, 30, const prefix0.Reflector(),
            -1, 2, 2, const <int>[], const [], null, null),
        r.ParameterMirrorImpl(r'email', 32774, 30, const prefix0.Reflector(),
            -1, 2, 2, const <int>[], const [], null, null),
        r.ParameterMirrorImpl(r'json', 16390, 31, const prefix0.Reflector(),
            null, null, null, const <int>[], const [], null, null)
      ],
      <Type>[
        prefix1.AuthResponseDto,
        prefix2.User,
        String,
        int,
        const m.TypeValue<Map<String, dynamic>>().type,
        Map,
        bool,
        Type,
        Object,
        Invocation
      ],
      2,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'toJson': (dynamic instance) => instance.toJson,
        r'accessToken': (dynamic instance) => instance.accessToken,
        r'expiresIn': (dynamic instance) => instance.expiresIn,
        r'refreshToken': (dynamic instance) => instance.refreshToken,
        r'id': (dynamic instance) => instance.id,
        r'userName': (dynamic instance) => instance.userName,
        r'password': (dynamic instance) => instance.password,
        r'firstName': (dynamic instance) => instance.firstName,
        r'lastName': (dynamic instance) => instance.lastName,
        r'email': (dynamic instance) => instance.email
      },
      {
        r'accessToken=': (dynamic instance, value) =>
            instance.accessToken = value,
        r'expiresIn=': (dynamic instance, value) => instance.expiresIn = value,
        r'refreshToken=': (dynamic instance, value) =>
            instance.refreshToken = value
      },
      <m.LibraryMirror>[
        r.LibraryMirrorImpl(r'', Uri.parse(r'reflectable://0/'),
            const prefix0.Reflector(), const <int>[], {}, {}, const [], null),
        r.LibraryMirrorImpl(r'', Uri.parse(r'reflectable://1/'),
            const prefix0.Reflector(), const <int>[], {}, {}, const [], null)
      ],
      [])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
