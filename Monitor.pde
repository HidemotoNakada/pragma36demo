class Monitor implements Runnable {
  LineNumberReader r;
  Monitor(InputStream is) {
    r = new LineNumberReader(new InputStreamReader(is));  
  }
  public void run() {
    try {
      while (true) { 
        String tmp = r.readLine();
        if (tmp == null) break;
        println(tmp);
      } 
    } catch (IOException e) {
    }
  }
}
