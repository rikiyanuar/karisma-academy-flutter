import 'package:flutter/material.dart';
import 'package:karisma_academy_flutter/chat/header_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MppLayanan extends StatefulWidget {
  const MppLayanan({super.key});

  @override
  State<MppLayanan> createState() => _MppLayananState();
}

class _MppLayananState extends State<MppLayanan> {
  List listLayanan = data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidget(),
          SizedBox(height: 10),
          Wrap(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    listLayanan = data;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                ),
                child: Text("All"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    listLayanan =
                        data.where((ele) => ele['kategori'] == 'ijin').toList();
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                ),
                child: Text("PEMKAB"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    listLayanan = data
                        .where((ele) => ele['kategori'] == 'surat')
                        .toList();
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                ),
                child: Text("SURAT"),
              ),
            ],
          ),
          SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: listLayanan.length,
              itemBuilder: (context, index) {
                var layanan = listLayanan[index];

                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      var uri = Uri.parse(layanan['href']);
                      launchUrl(uri);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/${layanan['image']}",
                            width: 80,
                          ),
                        ),
                        Text(
                          layanan['nama'],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

var data = [
  {
    "nama": "Apeldeskel",
    "keterangan": "Aplikasi layanan surat menyurat di wilayah Desa/Kelurahan",
    "kategori": "surat",
    "href": "http://apeldeskel.blitarkab.go.id/",
    "image": "apeldeskel_ikon.jpg"
  },
  {
    "nama": "Gmail",
    "keterangan": "Layanan surat menyurat elektronik (e-mail) milik Google",
    "kategori": "surat",
    "href": "https://mail.google.com/",
    "image": "ikon-portals_design-2.jpg"
  },
  {
    "nama": "Ymail",
    "keterangan": "Layanan surat menyurat elektronik (e-mail) milik Yahoo",
    "kategori": "surat",
    "href": "https://mail.yahoo.com/",
    "image": "ikon-portals_design-3.jpg"
  },
  {
    "nama": "OSS",
    "keterangan":
        "Perijinan berusaha terintegrasi secara elektronik / Online Single Submission",
    "kategori": "ijin",
    "href": "https://www.oss.go.id/oss/",
    "image": "ikon-portals_design-4.jpg"
  },
  {
    "nama": "I-Mobil",
    "keterangan": "Layanan mengajukan ijin usaha di DPMPTSP",
    "kategori": "ijin",
    "href": "http://i-mobil.blitarkab.go.id/web/home",
    "image": "ikon-portals_design-5.jpg"
  },
  {
    "nama": "Survey Kepuasan",
    "keterangan":
        "Data dan informasi tingkat kepuasan masyarakat tentang pelayanan publik Kabupaten Blitar",
    "kategori": "extra",
    "href": "http://skmdev.blitarkab.go.id/user/login",
    "image": "ikon-portals_design-6.jpg"
  },
  {
    "nama": "Daftar PLN",
    "keterangan": "Layanan PLN untuk pendaftaran listrik secara online",
    "kategori": "daftar",
    "href": "https://www.pln.co.id/pelanggan/layanan-online",
    "image": "ikon-portals_design-7.jpg"
  },
  {
    "nama": "BPJS Naker",
    "keterangan": "Layanan jaminan sosial ketenagakerjaan",
    "kategori": "daftar",
    "href": "https://antrian.bpjsketenagakerjaan.go.id/",
    "image": "ikon-portals_design-8.jpg"
  },
  {
    "nama": "E-Siap Online",
    "keterangan":
        "Layanan pendaftaran data kependudukan (KTP, KK, Akte Kelahiran, dll) secara online",
    "kategori": "daftar",
    "href": "http://siak.blitarkab.go.id/",
    "image": "ikon-portals_design-9.jpg"
  },
  {
    "nama": "Subsidi Listrik",
    "keterangan": "Layanan PLN utuk mengajukan dan mengadukan subsidi listrik",
    "kategori": "daftar",
    "href": "http://subsidi.djk.esdm.go.id/",
    "image": "ikon-portals_design-10.jpg"
  },
  {
    "nama": "NPWP",
    "keterangan": "Layanan pendaftaran NPWP secara online",
    "kategori": "daftar",
    "href": "https://ereg.pajak.go.id/login",
    "image": "ikon-portals_design-11.jpg"
  },
  {
    "nama": "E-Billing",
    "keterangan":
        "Layanan pembayaran pajak secara online menggunakan kode billing",
    "kategori": "bayar",
    "href": "https://www.pajak.go.id/id/e-billing",
    "image": "ikon-portals_design-12.jpg"
  },
  {
    "nama": "Daftar Paspor",
    "keterangan": "Layanan pendaftaran paspor secara online",
    "kategori": "daftar",
    "href": "https://antrian.imigrasi.go.id/",
    "image": "ikon-portals_design-13.jpg"
  },
  {
    "nama": "Go TKI",
    "keterangan": "Layanan pendaftaran calon TKI di luar negeri di Disnaker",
    "kategori": "daftar",
    "href": "http://gotki.blitarkab.go.id/",
    "image": "ikon-portals_design-14.jpg"
  },
  {
    "nama": "E-Filing",
    "keterangan": "Layanan penyampaian Surat Pemberitahuan (SPT) secara online",
    "kategori": "daftar",
    "href": "https://www.online-pajak.com/e-filing",
    "image": "ikon-portals_design-15.jpg"
  },
  {
    "nama": "Tiket KAI",
    "keterangan": "Layanan pembelian tiket kereta api",
    "kategori": "bayar",
    "href": "https://www.kai.id/",
    "image": "ikon-portals_design-16.jpg"
  },
  {
    "nama": "Katalog IKM",
    "keterangan": "Informasi produk Industri Kecil Menengah (IKM)",
    "kategori": "info",
    "href": "http://ikm.blitarkab.go.id/",
    "image": "ikon-portals_design-17.jpg"
  },
  {
    "nama": "Wesite Blitarkab",
    "keterangan": "Website resmi Pemerintah Kabupaten Blitar",
    "kategori": "info",
    "href": "http://www.blitarkab.go.id/",
    "image": "ikon-portals_design-18.jpg"
  },
  {
    "nama": "Kredit Bank Jatim",
    "keterangan": "Informasi kredit dan pengajuan kredit di Bank Jatim",
    "kategori": "daftar",
    "href": "https://eform.bankjatim.co.id/eformbjtm/home",
    "image": "ikon-portals_design-19.jpg"
  },
  {
    "nama": "SKCK Online",
    "keterangan": "Layanan pendaftaran SKCK secara online",
    "kategori": "daftar",
    "href": "https://skck.polri.go.id/",
    "image": "ikon-portals_design-20.jpg"
  },
  {
    "nama": "Loker Luar Negeri",
    "keterangan": "Info Pekerjaan Luar Negeri",
    "kategori": "info",
    "href": "http://jobsinfo.bnp2tki.go.id/",
    "image": "ikon-portals_design-21.jpg"
  },
  {
    "nama": "E-Samsat",
    "keterangan":
        "Layanan cek pajak kendaraan bermotor secara online menggunakan NOPOL",
    "kategori": "info",
    "href": "https://esamsat.jatimprov.go.id/",
    "image": "ikon-portals_design-22.jpg"
  },
  {
    "nama": "Eraterang",
    "keterangan":
        "Layanan permohonan surat keterangan pada pengadilan negeri secara elektronik",
    "kategori": "info",
    "href": "https://eraterang.badilum.mahkamahagung.go.id/masuk",
    "image": "ikon-portals_design-23.jpg"
  },
  {
    "nama": "E-Court",
    "keterangan":
        "Layanan pendaftaran perkara, taksiran panjar biaya perkara, pembayaran, pemanggilan hingga sidang",
    "kategori": "bayar",
    "href": "https://ecourt.mahkamahagung.go.id/",
    "image": "ikon-portals_design-24.jpg"
  },
  {
    "nama": "Antrian Dispendukcapil",
    "keterangan": "Layanan pendaftaran antrian di Dispendukcapil secara online",
    "kategori": "daftar",
    "href": "http://layanan.dispendukcapil.blitarkab.go.id/antrian/login.php",
    "image": "ikon-portals_design-25.jpg"
  },
  {
    "nama": "SIPP",
    "keterangan":
        "Sistem Informasi Penelusuran Perkara oleh Pengadilan Agama Kabupaten Blitar",
    "kategori": "info",
    "href": "https://sipp.pa-blitar.go.id/",
    "image": "ikon-portals_design-26.jpg"
  },
  {
    "nama": "Pendaftaran SIM",
    "keterangan": "Layanan pendaftaran SIM secara online oleh Korlantas Polri",
    "kategori": "daftar",
    "href": "http://sim.korlantas.polri.go.id/devregistrasi/",
    "image": "ikon-portals_design-27.jpg"
  },
  {
    "nama": "Pencatatan Persero",
    "keterangan":
        "Pencatatan dan pemesanan nama persero, yayasan maupun perkumpulan oleh Kemenkumham",
    "kategori": "daftar",
    "href": "https://ahu.go.id/sabh/perseroan/pesannama",
    "image": "ikon-portals_design-28.jpg"
  },
  {
    "nama": "Pendaftaran Ormas",
    "keterangan":
        "Layanan pendaftaran organisasi masyarakat secara online di Kemendagri",
    "kategori": "daftar",
    "href": "https://ula.kemendagri.go.id/daftar",
    "image": "ikon-portals_design-29.jpg"
  },
  {
    "nama": "PPOB",
    "keterangan": "Layanan transaksi pembayaran tagihan dalam satu tempat",
    "kategori": "bayar",
    "href": "https://transaksi.klikmbc.co.id/ppob/",
    "image": "ikon-portals_design-30.jpg"
  },
  {
    "nama": "Lelang",
    "keterangan": "Layanan proses lelang aset pemerintah daerah",
    "kategori": "info",
    "href": "https://lelang.go.id/kantor/66/KPKNL-Malang.html",
    "image": "ikon-portals_design-31.jpg"
  },
  {
    "nama": "Cek Produk BPOM",
    "keterangan":
        "Layanan pengecekan produk obat dan makanan yang telah mendapat petsetujuan ijin edar oleh BPOM",
    "kategori": "info",
    "href": "https://cekbpom.pom.go.id/",
    "image": "ikon-portals_design-32.jpg"
  },
  {
    "nama": "Sertifikat Halal MUI",
    "keterangan":
        "Sertifikasi halal untuk perusahaan makanan, kosmetik, dan obat-obatan oleh MUI",
    "kategori": "info",
    "href": "https://e-lppommui.org/new/",
    "image": "ikon-portals_design-33.jpg"
  },
  {
    "nama": "Pajak Kendaraan",
    "keterangan":
        "Layanan informasi pajak kendaran bermotor oleh Dipenda Pemprov Jatim",
    "kategori": "info",
    "href": "https://info.dipendajatim.go.id/index.php?page=info_pkb",
    "image": "ikon-portals_design-34.jpg"
  },
  {
    "nama": "Ijin Mendirikan Bangunan",
    "keterangan":
        "Layanan perijinan membangun baru, mengubah, memperluas, mengurangi, dan/atau merawat bangunan gedung",
    "kategori": "ijin",
    "href": "http://simbg.pu.go.id/",
    "image": "ikon-portals_design-35.jpg"
  },
  {
    "nama": "Kecamatan Dalam Angka",
    "keterangan":
        "Gambaran perkembangan Kecamatan di Kabupaten Blitar menurut Badan Pusat Statistik",
    "kategori": "info",
    "href": "https://blitarkab.bps.go.id/publication.html",
    "image": "ikon-portals_design-36.jpg"
  },
  {
    "nama": "E-Health",
    "keterangan": "Layanan kesehatan Pemerintah Kabupaten Blitar",
    "kategori": "info",
    "href": "https://ehealth.blitarkab.go.id/#home",
    "image": "ikon-portals_design-37.jpg"
  },
  {
    "nama": "Perkiraan Haji",
    "keterangan": "Layanan cek nomor porsi untuk perkiraan berangkat haji",
    "kategori": "info",
    "href":
        "http://www.indonesiabaik.id/infografis/cek-nomor-porsi-untuk-perkiraan-berangkat-haji",
    "image": "ikon-portals_design-38.jpg"
  },
  {
    "nama": "Bayar Pajak di Tokopedia",
    "keterangan": "Layanan pembayaran pajak tahunan dan PPOB melalui Tokopedia",
    "kategori": "bayar",
    "href": "https://www.tokopedia.com/pajak/",
    "image": "ikon-portals_design-39.jpg"
  },
  {
    "nama": "Simkah",
    "keterangan": "Sistem Informasi Manajemen Nikah oleh Kemenag",
    "kategori": "info",
    "href": "http://simkah.kemenag.go.id/",
    "image": "ikon-portals_design-40.jpg"
  },
  {
    "nama": "Ijin P2T",
    "keterangan": "Pelayanan Perijinan Terpadu oleh Pemprov Jatim",
    "kategori": "ijin",
    "href": "http://izin.p2t.jatimprov.go.id/",
    "image": "ikon-portals_design-41.jpg"
  },
  {
    "nama": "Inatrade",
    "keterangan": "Layanan perijinan pendaftaran eksport-import oleh Kemendag",
    "kategori": "daftar",
    "href": "http://inatrade.kemendag.go.id/index.php/registrasi",
    "image": "ikon-portals_design-42.jpg"
  },
  {
    "nama": "PPDB Online",
    "keterangan":
        "Layanan pendaftaran penerimaan peserta didik baru di Kabupaten Blitar",
    "kategori": "daftar",
    "href": "http://ppdb.blitarkab.go.id/",
    "image": "ikon-portals_design-43.jpg"
  },
  {
    "nama": "E-RUPBLITS",
    "keterangan":
        "Sistem informasi pencarian basan / barang RUPBASAN (Rumah Penyimpanan Benda Sitaan Negara ) Blitar",
    "kategori": "info",
    "href": "https://e-rupblits.id/",
    "image": "e-rupblits_ikon.png"
  },
  {
    "nama": "SABER PUNGLI",
    "keterangan":
        "SABER PUNGLI (Satuan Tugas Sapu Bersih Pungutan Liar) merupakan layanan pengaduan masyarakat dalam rangka pemberantasan pungli di Kabupaten Blitar",
    "kategori": "info",
    "href": "https://saberpungli.blitarkab.go.id",
    "image": "saberpungli_ikon.png"
  },
  {
    "nama": "BIG RICE V.3",
    "keterangan": "Blitar Regency Reserach and Innovation Center",
    "kategori": "extra",
    "href": "https://bigrice.blitarkab.go.id/",
    "image": "bigricev.3_ikon.png"
  },
  {
    "nama": "E-REPOSITORY LITBANG",
    "keterangan":
        "E-Repository Hasil Penelitian dan Pengembangan Pemerintah Kabupaten Blitar",
    "kategori": "extra",
    "href": "http://103.139.188.177/",
    "image": "e-repositorylitbang_ikon.png"
  },
  {
    "nama": "JURNAL PRADAH",
    "keterangan":
        "Diseminasi dan Sosialisai Hasil Kelitbangan melalui Jurnal Perspektif Pembangunan Daerah",
    "kategori": "extra",
    "href": "http://ejournal.blitarkab.go.id/",
    "image": "jurnalpradah_ikon.png"
  },
  {
    "nama": "SILANDAK",
    "keterangan": "Sistem Informasi Laporan Dana Alokasi Khusus",
    "kategori": "extra",
    "href": "https://app.integra.id/silandak-blitar/app/",
    "image": "silandak_ikon.png"
  },
  {
    "nama": "SIEVA RKPD",
    "keterangan": "Sistem Informasi Evaluasi Rencana Kerja Pemerintah Daerah",
    "kategori": "extra",
    "href": "https://sievarkpd.blitarkab.go.id/2022/",
    "image": "sievarkpd_ikon.png"
  },
  {
    "nama": "PENATARAN",
    "keterangan": "Pelayanan Prima Pendaftaran Instalasi Rawat Jalan",
    "kategori": "extra",
    "href":
        "https://play.google.com/store/apps/details?id=com.andro.jerry_pc.layananmasyarakatngudiwaluyo",
    "image": "penataran_ikon.png"
  },
  {
    "nama": "SIDAKSOS",
    "keterangan": "Sistem Informasi Data Kesejahteraan Sosial",
    "kategori": "extra",
    "href": "https://sidaksosp3ke.blitarkab.go.id/",
    "image": "sidaksos_ikon.png"
  },
  {
    "nama": "LAPAK DINKES",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://lapakdinkes.blitarkab.go.id/",
    "image": "lapakdinkes_ikon.png"
  },
  {
    "nama": "MONAS INDAH",
    "keterangan": "Monitoring, Pembinaan dan Pengawasan Inovasi Daerah",
    "kategori": "extra",
    "href": "https://linktr.ee/monasindah",
    "image": "monasindah_ikon.png"
  },
  {
    "nama": "TAS PELAJAR",
    "keterangan": "Tuntas Pelayanan Laka Jasa Raharja",
    "kategori": "extra",
    "href": "https://inovasi.rsudsrengat.my.id/taspelajar/",
    "image": "taspelajar_ikon.png"
  },
  {
    "nama": "SI RARA",
    "keterangan": "Sistem Informasi dan Reservasi Ruang Rapat",
    "kategori": "extra",
    "href": "https://wa.me/+6285136733592",
    "image": "sirara_ikon.png"
  },
  {
    "nama": "BLITAR 112",
    "keterangan": "Call Center Bebas Pulsa 112 (Gratis Semua Operator) 24 Jam",
    "kategori": "extra",
    "href": "https://www.instagram.com/112kabblitar/",
    "image": "blitar112_ikon.png"
  },
  {
    "nama": "SI CUPLIS",
    "keterangan": "Sistem Digital & Pelayanan Club Pediatri Saling Mengasihi",
    "kategori": "extra",
    "href": "https://linktr.ee/sicuplis",
    "image": "sicuplis_ikon.jpg"
  },
  {
    "nama": "SI BIMA SAKTI",
    "keterangan":
        "Sistem Pelayanan Terintegrasi Bayi Berat Badan Lahir Rendah dan Prematur di RS",
    "kategori": "extra",
    "href": "https://linktr.ee/sibimasakti",
    "image": "sibimasakti_ikon.jpg"
  },
  {
    "nama": "JEJAK DYAH GAYATRI",
    "keterangan":
        "Jejaring Komunitas Diabetes Melitus Dengan Upaya Edukasi Keluarga dan Pelayanan Terintegrasi",
    "kategori": "extra",
    "href": "https://linktr.ee/jejakdyahgayatri",
    "image": "jejakdyahgayatri_ikon.jpg"
  },
  {
    "nama": "SI TEMAN PINTAR",
    "keterangan":
        "Sistem Pelayanan Management ICU Terpadu RSUD Ngudi Waluyo Wlingi",
    "kategori": "extra",
    "href": "https://linktr.ee/sitemanpintar",
    "image": "sitemanpintar_ikon.jpg"
  },
  {
    "nama": "LAA KOK GITU MAS",
    "keterangan":
        "Layanan Konsultasi dan Konseling Gizi Turun Masyarakat yang merupakan inovasi unggulan dari Instalasi Gizi RSUD Srengat",
    "kategori": "extra",
    "href": "https://linktr.ee/LAAKOKGITUMAS",
    "image": "laakokgitumas_ikon.jpg"
  },
  {
    "nama": "SIPENTING",
    "keterangan": "Sistem Informasi Pemetaan Balita Stunting",
    "kategori": "extra",
    "href": "https://linktr.ee/SIPENTINGDINKES",
    "image": "sipenting_ikon.png"
  },
  {
    "nama": "NINGSUKAKU",
    "keterangan":
        "Peningkatan Nafsu Makan Balita Bermasalah Gizi melalui Akupresur",
    "kategori": "extra",
    "href": "https://linktr.ee/NINGSUKAKU",
    "image": "ningsukaku_ikon.png"
  },
  {
    "nama": "TALI CENTING",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://bit.ly/TALICENTING",
    "image": "talicenting_ikon.png"
  },
  {
    "nama": "SITAAT V.2",
    "keterangan": "SISTEM INFORMASI DATA KEGIATAN SATPOL PP",
    "kategori": "extra",
    "href": "https://linktr.ee/SITAAT_V2",
    "image": "sitaatv.2_ikon.jpg"
  },
  {
    "nama": "INFO SATSET",
    "keterangan": "Sedot WC Online",
    "kategori": "extra",
    "href": "https://linktr.ee/infosatset",
    "image": "infosatset_ikon.png"
  },
  {
    "nama": "LOREDA",
    "keterangan": "LOKER REGULASI DAERAH",
    "kategori": "extra",
    "href": "https://linktr.ee/loreda_blitar",
    "image": "loreda_ikon.jpg"
  },
  {
    "nama": "LAPAK MAINI",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://10.35.5.2/lapakmaini/",
    "image": "lapakmaini_ikon.jpg"
  },
  {
    "nama": "LAPAK SARAH",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://10.35.5.2/lapaksarah/",
    "image": "lapaksarah_ikon.png"
  },
  {
    "nama": "SI JARAN IJO",
    "keterangan": "Jemput Bola Rentan Adminduk Iso Jujuk Omah",
    "kategori": "extra",
    "href": "https://dispendukcapil.blitarkab.go.id/galeri-si-jaran-ijo/",
    "image": "sijaranijo_ikon.png"
  },
  {
    "nama": "SMART ESGODA",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://lynk.id/smart_esgoda",
    "image": "smartesgoda_ikon.jpg"
  },
  {
    "nama": "SIDO ANGSA",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://dinaspu.online.blitarkab.go.id/",
    "image": "sidoangsa_ikon.png"
  },
  {
    "nama": "TEMANI JAGA",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://pupr.sip.blitarkab.go.id/",
    "image": "temanijaga_ikon.png"
  },
  {
    "nama": "JUWITA",
    "keterangan": "Jum'at Kunjungan & Pengantaran Obat untuk ODGJ Tercinta",
    "kategori": "extra",
    "href": "https://bit.ly/m/JUWITA",
    "image": "juwita_ikon.jpg"
  },
  {
    "nama": "SATE PARU ENDOS",
    "keterangan": "-",
    "kategori": "info",
    "href": "https://bit.ly/m/SATE-PARU-ENDOS",
    "image": "sateparuendos_ikon.jpg"
  },
  {
    "nama": "KAMI ESGOSA",
    "keterangan": "Absensi dan tabungan digital",
    "kategori": "extra",
    "href": "https://dispendik.blitarkab.go.id/page/detail/kami-esgosa",
    "image": "kamiesgosa_ikon.png"
  },
  {
    "nama": "ECO ENZYME",
    "keterangan": "Transformasi sampah menjadi sabun mandi ramah lingkungan",
    "kategori": "extra",
    "href":
        "https://dispendik.blitarkab.go.id/page/detail/sabun-mandi-natural-eco-enzyme",
    "image": "ecoenzyme_ikon.jpg"
  },
  {
    "nama": "BANG ANJAR 2.5",
    "keterangan": "Bus angkutan pelajar",
    "kategori": "extra",
    "href": "https://linktr.ee/banganjar",
    "image": "banganjar2.5_ikon.jpg"
  },
  {
    "nama": "E-TRAFFIC 3.1",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://etraffic.blitarkab.go.id/",
    "image": "e-traffic3.1_ikon.jpg"
  },
  {
    "nama": "DAPODIK SILATURAHMI",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://dispendik.blitarkab.go.id/page/detail/dapodik-silaturahmi",
    "image": "dapodiksilaturahmi_ikon.jpg"
  },
  {
    "nama": "FESTIVAL KRESNAYANA",
    "keterangan": "-",
    "kategori": "extra",
    "href":
        "https://www.youtube.com/playlist?list=PLXtSWJ6vsp252d1mlrFnvlg2ZXob_Sf3r",
    "image": "festivalkresnayana_ikon.png"
  },
  {
    "nama": "E-SPTPD",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://e-sptpd.blitarkab.go.id/",
    "image": "e-sptpd_ikon.jpg"
  },
  {
    "nama": "SIMONTORAN",
    "keterangan":
        "Sistem Monitoring Ajuan Keuangan Sekretariat Daerah Kabupaten Blitar Transparansi dan Efisiensi dalam Pengelolaan Keuangan Daerah",
    "kategori": "extra",
    "href": "https://perencanaan.blitarkab.go.id/simontoran/index.html",
    "image": "simontoran_ikon.png"
  },
  {
    "nama": "AJI TANI",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://linktr.ee/bidanghi.nakerblitarkab",
    "image": "ajitani_ikon.jpg"
  },
  {
    "nama": "POSWILIAM V.2",
    "keterangan": "-",
    "kategori": "extra",
    "href":
        "https://sites.google.com/view/rumahdigitalinovasi-kecwates/poswiliam-v-2",
    "image": "poswiliamv.2_ikon.jpg"
  },
  {
    "nama": "SI TOGA",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://www.instagram.com/kampung.toga/",
    "image": "sitoga_ikon.jpg"
  },
  {
    "nama": "SEMPOL MAS SAM PLUS",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://linktr.ee/sempolMasSamPLUS",
    "image": "sempolmassamplus_ikon.jpg"
  },
  {
    "nama": "GALI POTENSI",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://linktr.ee/galipotensi",
    "image": "galipotensi_ikon.jpg"
  },
  {
    "nama": "SIMPLE KEC. PANGGUNGREJO",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://linktr.ee/kec.panggungrejo",
    "image": "simplekec.panggungrejo_ikon.jpg"
  },
  {
    "nama": "OPP LTSA",
    "keterangan": "-",
    "kategori": "extra",
    "href":
        "https://disnaker.blitarkab.go.id/layanan-program/orientasi-pra-pemberangkatan-di-layanan-terpadu-satu-atappekerja-migran-indonesia-opp-ltsa-pmi/",
    "image": "oppltsa_ikon.jpg"
  },
  {
    "nama": "GRIYA SEHAT",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://linktr.ee/Griyasehat_",
    "image": "griyasehat_ikon.png"
  },
  {
    "nama": "SICINTA",
    "keterangan": "-",
    "kategori": "extra",
    "href": "http://sicintalabpakan.blitarkab.go.id/",
    "image": "sicinta_ikon.png"
  },
  {
    "nama": "BISIK",
    "keterangan": "Podcast Literasi Bincang Asyik",
    "kategori": "extra",
    "href":
        "https://www.youtube.com/playlist?list=PLntvtOwoPbrZQEzxfHi4dzIb8MnUur146",
    "image": "bisik_ikon.png"
  },
  {
    "nama": "GAMELAN",
    "keterangan": "-",
    "kategori": "extra",
    "href":
        "https://www.instagram.com/reel/DNsb-ZUYvco/?igsh=MXNvYnBhanM5Y2NveA%3D%3D",
    "image": "gamelan_ikon.png"
  },
  {
    "nama": "E-INVENTORY",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://e-inventory.blitarkab.go.id/",
    "image": "e-inventory_ikon.png"
  },
  {
    "nama": "SITAMPAN",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://sikanda.blitarkab.go.id/etamsil/",
    "image": "sitampan_ikon.jpg"
  },
  {
    "nama": "SIDAWAI",
    "keterangan": "-",
    "kategori": "extra",
    "href": "https://sidawai.blitarkab.go.id/sidawai-desk#",
    "image": "sidawai_ikon.png"
  }
];
