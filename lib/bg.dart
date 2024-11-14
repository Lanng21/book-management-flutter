  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
  import 'main.dart';
  // import 'package:image_picker/image_picker.dart';
  // import 'dart:io';
  // import 'package:firebase_storage/firebase_storage.dart';
  import 'save.dart';

  // ignore: camel_case_types
  class resgisterbook extends StatefulWidget {
    const resgisterbook({super.key});

    @override
    State<resgisterbook> createState() => _resgisterbookState();
  }

  // ignore: camel_case_types
  class _resgisterbookState extends State<resgisterbook> {
    
    final _namect = TextEditingController();
    final _actct = TextEditingController();
    final _categoryct = TextEditingController();
    final _companypublishingct = TextEditingController();
    final _daypublishingct = TextEditingController();
    final _descriptionct = TextEditingController();
    final _pricect = TextEditingController();
    // ignore: non_constant_identifier_names
    String book_id = '';

    void initState() {
    super.initState();
    // Khởi tạo bất kỳ dữ liệu nào nếu cần ở đây
  }
    void reset(){
      _namect.clear();
      _actct.clear();
      _categoryct.clear();
      _companypublishingct.clear();
      _daypublishingct.clear();
        _descriptionct.clear();
      _pricect.clear();
    
    }
void adds() async {
  try {
    await savebook.addbook(
      _namect.text, 
      _actct.text, 
      _categoryct.text, 
      _companypublishingct.text, 
      _daypublishingct.text, 
      _pricect.text,
      _descriptionct.text,
    );
    reset(); // Gọi reset form

    // Hiển thị thông báo thành công
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thêm sách thành công!'), backgroundColor: Colors.green,)
    );
  } catch (e) {
    // Hiển thị thông báo lỗi
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Có lỗi xảy ra khi thêm sách.'),  backgroundColor: Colors.red)
    );
  }
}


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text('Đăng kí sách', style: TextStyle(color: Colors.red),),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.white, width: 1))
        ),
      ),
      actions: <Widget>[
        IconButton(onPressed: reset, icon: const Icon(Icons.refresh, size: 25,)),
        IconButton(onPressed: (){
              Navigator.push(context,
              (MaterialPageRoute(builder: (context)=>const TheList())));
            }, icon: const Icon(Icons.home, size: 30,))
      ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/pic7.jpg'),
                    fit: BoxFit.cover
                    )
                ),
            ),
            Container(
              padding:const EdgeInsets.all(15),
              margin:const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(136, 0, 0, 0),
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                    const SizedBox(height: 20),
                      TextFormField(
                        controller: _namect,
                        style:const TextStyle(color: Colors.white),
                        decoration:const InputDecoration(
                          labelText: 'nhập tên sách',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                        ),
                      ),

                      const SizedBox(height: 20),
                        TextFormField(
                        controller: _actct,
                        style:const TextStyle(color: Colors.white),
                        decoration:const InputDecoration(
                          labelText: 'nhập tên tác giả',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                        ),

                      ),
                      const SizedBox(height: 20),
                        TextFormField(
                        controller: _categoryct,
                        style:const TextStyle(color: Colors.white),
                        decoration:const InputDecoration(
                          labelText: 'nhập thể loại',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                        ),
                      ),
                      const SizedBox(height: 20),
                        TextFormField(
                        controller: _companypublishingct,
                        style:const TextStyle(color: Colors.white),
                        decoration:const InputDecoration(
                          labelText: 'nhập nhà sản xuất',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                        ),
                      ),
                      const SizedBox(height: 20),
                        TextFormField(
                        controller: _daypublishingct,
                        style:const TextStyle(color: Colors.white),
                        decoration:const InputDecoration(
                          labelText: 'nhập ngày xuất bản',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                        ),
                      ),
                      const SizedBox(height: 20),
                          TextFormField(
                        controller: _pricect,
                        style:const TextStyle(color: Colors.white),
                        decoration:const InputDecoration(
                          labelText: 'nhập giá sách',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                        ),
                      ),
                      const SizedBox(height: 20),
                          TextFormField(
                        controller: _descriptionct,
                        style:const TextStyle(color: Colors.white),
                        decoration:const InputDecoration(
                          labelText: 'nhập mô tả sách',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: adds,
                            style:const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.black),
                            side: MaterialStatePropertyAll(BorderSide(color: Colors.white))
                            ),
                          
                          child:const Text('Đăng Kí', style: TextStyle(color:Colors.red),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
  class BookUpdatePage extends StatefulWidget {
    final String bookId; // ID của sách cần cập nhật

    const BookUpdatePage({Key? key, required this.bookId}) : super(key: key);

    @override
    // ignore: library_private_types_in_public_api
    _BookUpdatePageState createState() => _BookUpdatePageState();
  }

  class _BookUpdatePageState extends State<BookUpdatePage> {
    
      @override
  void initState() {
    super.initState();
    _loadBookData();
  }
    Future<void> _loadBookData() async {
    try {
      // Lấy thông tin sách từ Firestore
      final db = FirebaseFirestore.instance;
      final docSnapshot = await db.collection('books').doc(widget.bookId).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        setState(() {
          _namect.text = data['name'] ?? '';
          _actct.text = data['actor'] ?? '';
          _categoryct.text = data['category'] ?? '';
          _companypublishingct.text = data['companypublishing'] ?? '';
          _daypublishingct.text = data['daypublishing'] ?? '';
          _pricect.text = data['price'] ?? '';
          _descriptionct.text = data['description'] ?? '';
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Không thể tải thông tin sách: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

    final _namect = TextEditingController();
    final _actct = TextEditingController();
    final _categoryct = TextEditingController();
    final _companypublishingct = TextEditingController();
    final _daypublishingct = TextEditingController();
    final _descriptionct = TextEditingController();
    final _pricect = TextEditingController();

    @override
    void dispose() {
      _namect.dispose();
      _actct.dispose();
      _categoryct.dispose();
      _companypublishingct.dispose();
      _daypublishingct.dispose();
      _descriptionct.dispose();
      _pricect.dispose();

      super.dispose();
    }

  Future<void> updateBookInfo() async {

    try {
      // Gọi phương thức updateBook từ lớp savedata
      await savebook.updateBook(
        widget.bookId,
        _namect.text,
        _actct.text,
        _categoryct.text,
        _companypublishingct.text,
        _daypublishingct.text,
        _pricect.text,
        _descriptionct.text,
        // imageUrl,
        // _imageName
      );

      // Hiển thị thông báo cập nhật thành công
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cập nhật thành công'), backgroundColor: Colors.green,));
    } catch (e) {
      // Hiển thị thông báo sửa không thành công
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cập nhật không thành công: $e'), backgroundColor: Colors.red,));
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text('Cập nhật thông tin sách', style: TextStyle(color: Color.fromARGB(255, 245, 126, 47)),),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          centerTitle: true,
          flexibleSpace: Container(
            decoration:const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color.fromARGB(255, 247, 83, 18), width: 1))
            ),
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context,
              (MaterialPageRoute(builder: (context)=>const TheList())));
            }, icon: const Icon(Icons.home, size: 30,))
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration:const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pic6.jpg'),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              padding:const EdgeInsets.all(15),
              margin:const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black54,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(15)
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                  const SizedBox(height: 15,),
                    TextField(
                      controller: _namect,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Cập Nhật Tên sách',
                        labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                      ),
                    ),
                      const SizedBox(height: 20,),
                    TextField(
                      controller: _actct,
                      style:const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Cập Nhật tác giả',
                        labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),

                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextField(
                      controller: _categoryct,
                      style:const TextStyle(color: Colors.white),
                      decoration:const InputDecoration(labelText: 'Cập Nhật thể loại',
                      labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                      ),
                    ),
                    const  SizedBox(height: 20,),
                    TextField(
                      controller: _companypublishingct,
                      style:const TextStyle(color: Colors.white),
                      decoration:const InputDecoration(labelText: 'Cập Nhật nhà xuất bản',
                      labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                      ),
                    ),
                      const SizedBox(height: 20,),
                      TextField(
                      controller: _daypublishingct,
                      style:const TextStyle(color: Colors.white),
                      decoration:const InputDecoration(labelText: 'Cập Nhật năm suất bản',
                      labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                      ),
                    ),
                      const SizedBox(height: 20,),
                    TextField(
                      controller: _pricect,
                      style:const TextStyle(color: Colors.white),
                      decoration:const InputDecoration(labelText: 'Cập Nhật giá',
                      labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),),
                    ),
                      const SizedBox(height: 20,),
                      TextField(
                      controller: _descriptionct,
                      style:const TextStyle(color: Colors.white),
                      decoration:const InputDecoration(labelText: 'Cập Nhật mô tả',
                      labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: updateBookInfo,
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.black),
                          side: MaterialStatePropertyAll(BorderSide(color: Colors.white, width: 2))
                      ),
                      child: const Text('Cập nhật thông tin sách',style: TextStyle(color: Colors.orange),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      );
    }
  }