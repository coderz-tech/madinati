import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/locale/data/repositories/locale_repository_impl.dart';
import 'core/locale/domain/entities/local_model.dart';
import 'core/locale/domain/repositories/locale_repository.dart';
import 'core/locale/presentation/cubit/locale_cubit.dart';
import 'core/utils/location_permission.dart';
import 'features/home/presentation/cubits/nav_bar_cubit.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'features/tabs/presentation/cubits/tabs_cubit.dart';
import 'features/theme/data/datasources/theme_local_data_source.dart';
import 'features/theme/data/repositories/theme_repository_impl.dart';
import 'features/theme/domain/repositories/theme_repository.dart';
import 'features/theme/domain/usecases/get_is_dark_theme.dart';
import 'features/theme/domain/usecases/set_is_dark_theme.dart';
import 'features/theme/presentation/cubits/theme_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeRepository themeRepository = ThemeRepositoryImpl(
    localDataSource: ThemeLocalDataSourceImpl(),
  );

  final LocaleRepository localeRepository = LocaleRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<NavBarCubit>(
          create: (context) => NavBarCubit(),
          child: HomeScreen(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(
            getIsDarkTheme: GetIsDarkTheme(repository: themeRepository),
            setIsDarkTheme: SetIsDarkTheme(repository: themeRepository),
          ),
        ),
        BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit(localeRepository: localeRepository),
        ),
        BlocProvider<TabsCubit>(create: (_) => TabsCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return BlocBuilder<LocaleCubit, List<LocalModel>>(
            builder: (context, state) {
              return MaterialApp(
                builder: (context, child) =>
                    LocationHardBlock(child: child ?? const SizedBox.shrink()),
                localizationsDelegates: [
                  AppLocalizations.delegate, // Add this line

                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale('en'),
                  Locale('ar'),
                  Locale('hi'),
                  Locale("ur"),
                ],
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: theme,
                locale: state.firstWhere((element) => element.isCurrent).locale,
                // home: ThemeDemoScreen(),
                home: SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
