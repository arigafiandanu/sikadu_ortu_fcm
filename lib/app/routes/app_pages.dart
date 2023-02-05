import 'package:get/get.dart';

import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/data_diri/bindings/data_diri_binding.dart';
import '../modules/data_diri/views/data_diri_view.dart';
import '../modules/detail_pengumuman/bindings/detail_pengumuman_binding.dart';
import '../modules/detail_pengumuman/views/detail_pengumuman_view.dart';
import '../modules/ganti_password/bindings/ganti_password_binding.dart';
import '../modules/ganti_password/views/ganti_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/informasi_lainnya/bindings/informasi_lainnya_binding.dart';
import '../modules/informasi_lainnya/views/informasi_lainnya_view.dart';
import '../modules/listChat/bindings/list_chat_binding.dart';
import '../modules/listChat/views/list_chat_view.dart';
import '../modules/list_pengumuman/bindings/list_pengumuman_binding.dart';
import '../modules/list_pengumuman/views/list_pengumuman_view.dart';
import '../modules/list_rekap_nilai_perkelas/bindings/list_rekap_nilai_perkelas_binding.dart';
import '../modules/list_rekap_nilai_perkelas/views/list_rekap_nilai_perkelas_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/lupaPass/bindings/lupa_pass_binding.dart';
import '../modules/lupaPass/views/lupa_pass_view.dart';
import '../modules/pelajaran/bindings/pelajaran_binding.dart';
import '../modules/pelajaran/views/pelajaran_view.dart';
import '../modules/pengumuman_kelas/bindings/pengumuman_kelas_binding.dart';
import '../modules/pengumuman_kelas/views/pengumuman_kelas_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/rekap_nilai/bindings/rekap_nilai_binding.dart';
import '../modules/rekap_nilai/views/rekap_nilai_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.LIST_CHAT,
      page: () => const ListChatView(),
      binding: ListChatBinding(),
    ),
    GetPage(
      name: _Paths.LUPA_PASS,
      page: () => LupaPassView(),
      binding: LupaPassBinding(),
    ),
    GetPage(
      name: _Paths.LIST_PENGUMUMAN,
      page: () => const ListPengumumanView(),
      binding: ListPengumumanBinding(),
    ),
    GetPage(
      name: _Paths.DATA_DIRI,
      page: () => const DataDiriView(),
      binding: DataDiriBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PENGUMUMAN,
      page: () => const DetailPengumumanView(),
      binding: DetailPengumumanBinding(),
    ),
    GetPage(
      name: _Paths.GANTI_PASSWORD,
      page: () => const GantiPasswordView(),
      binding: GantiPasswordBinding(),
    ),
    GetPage(
      name: _Paths.LIST_REKAP_NILAI_PERKELAS,
      page: () => const ListRekapNilaiPerkelasView(),
      binding: ListRekapNilaiPerkelasBinding(),
    ),
    GetPage(
      name: _Paths.PELAJARAN,
      page: () => const PelajaranView(),
      binding: PelajaranBinding(),
    ),
    GetPage(
      name: _Paths.INFORMASI_LAINNYA,
      page: () => const InformasiLainnyaView(),
      binding: InformasiLainnyaBinding(),
    ),
    GetPage(
      name: _Paths.PENGUMUMAN_KELAS,
      page: () => const PengumumanKelasView(),
      binding: PengumumanKelasBinding(),
    ),
    GetPage(
      name: _Paths.REKAP_NILAI,
      page: () => RekapNilaiView(),
      binding: RekapNilaiBinding(),
    ),
  ];
}
