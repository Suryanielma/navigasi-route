import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(MaterialApp(
    home: BookListScreen(),
  ));
}

class BookListScreen extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      'title': 'Pride and Prejudice',
      'author': 'Jane Austen',
      'description':
          'Novel klasik tentang cinta, kelas sosial, dan pernikahan di Inggris abad ke-19, mengikuti Elizabeth Bennet yang cerdas dalam menghadapi ekspektasi masyarakat dan sosok Mr. Darcy yang sombong.',
      'pdf': 'https://www.planetebook.com/free-ebooks/pride-and-prejudice.pdf',
    },
    {
      'title': 'Frankenstein',
      'author': 'Mary Wollstonecraft Shelley',
      'description':
          'Frankenstein adalah novel gothic fiksi ilmiah karya Mary Shelley yang pertama kali diterbitkan pada tahun 1818. '
          'Kisah ini mengikuti Victor Frankenstein, seorang ilmuwan muda yang ambisius dari Jenewa yang terobsesi dengan '
          'rahasia kehidupan dan kematian. Didorong oleh rasa ingin tahu yang tak terbendung, ia berhasil menciptakan '
          'makhluk hidup dari bagian-bagian tubuh manusia melalui eksperimen ilmiah yang kontroversial. Namun begitu '
          'makhluk itu hidup, Victor diliputi rasa ngeri dan meninggalkannya begitu saja. '
          'Makhluk yang kesepian dan tersisih itu pun tumbuh dengan penuh kebencian akibat penolakan dari penciptanya '
          'sendiri maupun masyarakat sekitarnya. Ia menuntut Victor untuk menciptakan teman hidup baginya, dan ketika '
          'permintaan itu ditolak, ia mulai melancarkan balas dendam yang menghancurkan semua orang yang dicintai Victor. '
          'Novel ini mengeksplorasi tema-tema besar seperti ambisi ilmu pengetahuan yang melampaui batas etika, '
          'tanggung jawab seorang pencipta terhadap ciptaannya, kesepian, penolakan sosial, serta pertanyaan mendalam '
          'tentang apa artinya menjadi manusia. Frankenstein sering dianggap sebagai salah satu novel fiksi ilmiah '
          'pertama dalam sejarah sastra dan tetap relevan hingga hari ini sebagai peringatan akan bahaya sains tanpa nurani.',
      'pdf': 'https://www.planetebook.com/free-ebooks/frankenstein.pdf',
    },
    {
      'title': "Alice's Adventures in Wonderland",
      'author': 'Lewis Carroll',
      'description':
          'Novel fantasi tentang Alice yang jatuh ke lubang kelinci menuju negeri ajaib penuh makhluk aneh, teka-teki, dan petualangan surealis yang tak terlupakan.',
      'pdf': 'https://www.planetebook.com/free-ebooks/alices-adventures-in-wonderland.pdf',
    },
    {
      'title': 'Moby Dick',
      'author': 'Herman Melville',
      'description':
          'Novel epik petualangan laut yang mengisahkan obsesi Kapten Ahab mencari balas dendam pada paus putih raksasa Moby Dick, dinarasikan oleh pelaut muda bernama Ishmael.',
      'pdf': 'https://www.planetebook.com/free-ebooks/moby-dick.pdf',
    },
    {
      'title': 'The Picture of Dorian Gray',
      'author': 'Oscar Wilde',
      'description':
          'Novel filosofis tentang Dorian Gray yang tetap abadi muda sementara potretnya menanggung beban dosa, mengeksplorasi tema kecantikan, hedonisme, dan korupsi moral.',
      'pdf': 'https://www.planetebook.com/free-ebooks/the-picture-of-dorian-gray.pdf',
    },
    {
      'title': 'A Tale of Two Cities',
      'author': 'Charles Dickens',
      'description':
          'Novel sejarah berlatar Revolusi Prancis yang menganyam kisah pengorbanan dan kebangkitan, mengikuti Charles Darnay dan Sidney Carton di tengah kekacauan Paris dan London.',
      'pdf': 'https://www.planetebook.com/free-ebooks/a-tale-of-two-cities.pdf',
    },
    {
      'title': 'The Metamorphosis',
      'author': 'Franz Kafka',
      'description':
          'Novela surealis tentang Gregor Samsa yang bangun dan mendapati dirinya berubah menjadi serangga raksasa, mengeksplorasi tema alienasi, identitas, dan hubungan keluarga.',
      'pdf': 'https://www.planetebook.com/free-ebooks/the-metamorphosis.pdf',
    },
    {
      'title': 'Crime and Punishment',
      'author': 'Fyodor Dostoevsky',
      'description':
          'Novel psikologis tentang Raskolnikov, seorang mahasiswa miskin di St. Petersburg yang merencanakan dan melakukan pembunuhan, lalu berjuang dengan rasa bersalah dan pencarian penebusan diri.',
      'pdf': 'https://www.planetebook.com/free-ebooks/crime-and-punishment.pdf',
    },
    {
      'title': 'Great Expectations',
      'author': 'Charles Dickens',
      'description':
          'Kisah perjalanan hidup Pip dari seorang anak yatim miskin hingga menjadi pria berambisi tinggi di London, penuh kejutan tentang identitas, cinta, dan nilai sejati kehidupan.',
      'pdf': 'https://www.planetebook.com/free-ebooks/great-expectations.pdf',
    },
    {
      'title': 'Dracula',
      'author': 'Bram Stoker',
      'description':
          'Novel horor Gothic tentang Count Dracula, vampir asal Transylvania yang berusaha pindah ke Inggris untuk menemukan mangsa baru, dan perlawanan sekelompok orang untuk menghentikannya.',
      'pdf': 'https://www.planetebook.com/free-ebooks/dracula.pdf',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book List')),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index]['title']!),
            subtitle: Text(books[index]['author']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(
                    title: books[index]['title']!,
                    author: books[index]['author']!,
                    description: books[index]['description']!,
                    url: books[index]['pdf']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String url;

  BookDetailScreen({required this.title, required this.author, required this.description, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Title: $title', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Author: $author', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            SizedBox(height: 12),
            Text('Description:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text(description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),

             ElevatedButton(
               onPressed: () {
                 Navigator.push(context,
                   MaterialPageRoute(
                     builder: (context) => ReadingBookFile(
                       url: url,
                     ),
                   ),
                 );
               },
               child: Text('Read the book'),
             ),
          ],
        ),
      ),
    ),
    );
  }
}

class ReadingBookFile extends StatefulWidget {
  final String url;
  ReadingBookFile({required this.url});

  @override
  _ReadingBookFileState createState() => _ReadingBookFileState();
}

class _ReadingBookFileState extends State<ReadingBookFile> {
  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading Book'),
      ),
      body: SfPdfViewer.network(
        widget.url,
        controller: _pdfViewerController,
        onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Gagal memuat PDF: ${details.description}')),
          );
        },
      ),
    );
  }
}

//L200230252_Suryani Elmaghfiroh