// download_images.dart
// Dart console script to download a list of image URLs and save them locally.
// Usage:
// 1) dart pub get
// 2) dart run download_images.dart
//
// Output:
//  - images/          (directory with downloaded files)
//  - images_map.json  (JSON with metadata per URL)

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

final List<String> urls = [
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/apeldeskel_ikon.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-2.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-3.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-4.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-5.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-6.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-7.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-8.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-9.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-10.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-11.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-12.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-13.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-14.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-15.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-16.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-17.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-18.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-19.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-20.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-21.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-22.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-23.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-24.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-25.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-26.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-27.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-28.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-29.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-30.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-31.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-32.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-33.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-34.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-35.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-36.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-37.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-38.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-39.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-40.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-41.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-42.jpg",
  "http://mpp.blitarkab.go.id/public/assets/img/icon2/ikon%20portals_design-43.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/e-rupblits_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/saberpungli_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/bigricev.3_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/e-repositorylitbang_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/jurnalpradah_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/silandak_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sievarkpd_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/penataran_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sidaksos_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/lapakdinkes_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/monasindah_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/taspelajar_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sirara_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/blitar112_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sicuplis_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sibimasakti_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/jejakdyahgayatri_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sitemanpintar_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/laakokgitumas_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sipenting_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/ningsukaku_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/talicenting_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sitaatv.2_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/infosatset_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/loreda_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/lapakmaini_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/lapaksarah_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sijaranijo_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/smartesgoda_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sidoangsa_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/temanijaga_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/juwita_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sateparuendos_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/kamiesgosa_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/ecoenzyme_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/banganjar2.5_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/e-traffic3.1_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/dapodiksilaturahmi_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/festivalkresnayana_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/e-sptpd_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/simontoran_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/ajitani_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/poswiliamv.2_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sitoga_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sempolmassamplus_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/galipotensi_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/simplekec.panggungrejo_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/oppltsa_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/griyasehat_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sicinta_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/bisik_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/gamelan_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/e-inventory_ikon.png",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sitampan_ikon.jpg",
  "https://mpp.blitarkab.go.id/public/assets/img/icon2/sidawai_ikon.png"
];

final int maxConcurrent = 6;
final int maxRetries = 3;
final Directory imagesDir = Directory('images');

String sanitizeFilename(String s) {
  // keep extension, remove querystring
  var base = s.split('?').first;
  var name = p.basename(base);
  // replace spaces and weird chars
  name = name.replaceAll(RegExp(r'[<>:"/\\\\|?*\x00-\x1F]'), '_');
  // fallback if empty
  if (name.isEmpty) name = 'image';
  return name;
}

Uri toUri(String raw) {
  try {
    var u = Uri.parse(raw);
    if (!u.hasScheme) throw FormatException();
    return u;
  } catch (_) {
    // try encoding
    return Uri.parse(Uri.encodeFull(raw));
  }
}

Future<Map<String, dynamic>> downloadOne(String url) async {
  var entry = {
    'original_url': url,
    'filename': null,
    'saved_path': null,
    'status': 'failed',
    'http_status': null,
    'error': null
  };

  final uri = toUri(url);
  final filenameBase = sanitizeFilename(
      uri.pathSegments.isNotEmpty ? uri.pathSegments.last : uri.path);
  var filename = filenameBase;
  // ensure directory exists
  if (!imagesDir.existsSync()) imagesDir.createSync(recursive: true);

  // avoid overwrite by adding suffix
  int suffix = 0;
  String filepath;
  do {
    var candidate = suffix == 0
        ? filename
        : '${p.basenameWithoutExtension(filename)}_$suffix${p.extension(filename)}';
    filepath = p.join(imagesDir.path, candidate);
    suffix++;
  } while (File(filepath).existsSync());

  int attempt = 0;
  while (attempt < maxRetries) {
    attempt++;
    try {
      final resp = await http.get(uri).timeout(Duration(seconds: 20));
      entry['http_status'] = resp.statusCode.toString();
      if (resp.statusCode == 200) {
        final file = File(filepath);
        await file.writeAsBytes(resp.bodyBytes);
        entry['filename'] = p.basename(filepath);
        entry['saved_path'] = filepath;
        entry['status'] = 'ok';
        return entry;
      } else {
        entry['error'] = 'HTTP ${resp.statusCode}';
        // retry for 5xx
        if (resp.statusCode >= 500 && attempt < maxRetries) {
          await Future.delayed(Duration(milliseconds: 500 * attempt));
          continue;
        } else {
          return entry;
        }
      }
    } catch (e) {
      entry['error'] = e.toString();
      if (attempt < maxRetries) {
        await Future.delayed(Duration(milliseconds: 400 * attempt));
        continue;
      } else {
        return entry;
      }
    }
  }
  return entry;
}

Future<List<Map<String, dynamic>>> downloadAll(List<String> list) async {
  final results = <Map<String, dynamic>>[];
  final queue = List<String>.from(list);
  final active = <Future>[];

  while (queue.isNotEmpty || active.isNotEmpty) {
    while (queue.isNotEmpty && active.length < maxConcurrent) {
      final url = queue.removeAt(0);
      final f = downloadOne(url).then((res) {
        stdout.writeln(
            '[${res['status']}] ${res['original_url']} -> ${res['filename'] ?? res['error']}');
        results.add(res);
      });
      active.add(f);
      // remove completed futures from active list later
      f.whenComplete(() => active.remove(f));
    }
    // small pause to let futures proceed
    if (active.isNotEmpty) {
      await Future.any(active);
    }
  }
  return results;
}

void main() async {
  stdout.writeln(
      'Starting download (${urls.length} urls). Max concurrent: $maxConcurrent');
  final res = await downloadAll(urls);
  final outFile = File('images_map.json');
  await outFile.writeAsString(JsonEncoder.withIndent('  ')
      .convert({'count': res.length, 'items': res}));
  stdout
      .writeln('Done. Saved metadata to images_map.json. Images in ./images/');
}
