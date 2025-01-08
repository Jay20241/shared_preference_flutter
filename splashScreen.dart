

//Only logic part
void initState(){
    super.initState();

    Timer(Duration(seconds:2), (){
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => LoginPage(),));
    });
}

//Icon(Icons.myCompanyLogo, color: Colors.white.withOpacity(0.5))