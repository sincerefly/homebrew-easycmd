class Easycmd < Formula
    desc "A terminal tool sample "
    homepage "https://github.com/sincerefly/easycmd/"
    url "https://github.com/sincerefly/easycmd/archive/refs/tags/v0.0.4.tar.gz"
    sha256 "79d9b7b9fc28c1cb47ecc5c14da2e911b7da96481f043e87ec1376ca82f7f363"
    license "MIT"
    head "https://github.com/sincerefly/easycmd.git", branch: "master"
  
    bottle do
      root_url "https://dd-public-bucket.s3.bitiful.net/homebrew-bottles/easycmd/v0.0.4"
      #sha256 cellar: :any_skip_relocation, arm64_sonoma:   "bc36b4b41929e9e689befbecb557dbf7acf6c743ca17809f65a109ef23833c0b"
      sha256 cellar: :any_skip_relocation, arm64_ventura:  "1ec122e6913fd32af03092a2e7b3897cc77090003373f165072ab019daa2d68c"
      #sha256 cellar: :any_skip_relocation, arm64_monterey: "1d652cf11ad65dac1d8c772168f62ca6e672ee61f69f9c47b5a46819089f1cfe"
      #sha256 cellar: :any_skip_relocation, sonoma:         "3f23e27ff4f8ea8a39b07ae5b7d808d5a5cbc548124b56154c0b08585737eb23"
      #sha256 cellar: :any_skip_relocation, ventura:        "ccbd38a9b07256344d78bd127fb66f4d2b0f4831385d7458f5e36bed8f796548"
      #sha256 cellar: :any_skip_relocation, monterey:       "85a5394913a5734cef1fc388eee37e4dfb21c69e4414c8c658b8e04cb9963262"
      #sha256 cellar: :any_skip_relocation, x86_64_linux:   "8642969ca0738f0a4e632ee2877edf601e2747220460b29e8ab3368ff3e80a0e"
    end
  
    depends_on "go" => :build
  
    def install
      system "make", "build"
  
      bin.install "easycmd"
    end
  
    def post_install
  
      # Make sure runtime directories exist
      (var/"lib/easycmd").mkpath
      (var/"log/easycmd").mkpath
    end
  
    def caveats
      s = <<~EOS
        Data:    #{var}/lib/easycmd/
        Logs:    #{var}/log/easycmd/easycmd.log
        Config:  #{etc}/easycmd/
      EOS
  
      s
    end
  
    test do
      output = shell_output("#{bin}/easycmd --version").chomp
      assert output.start_with?("easycmd ")
      system "false"
    end
  
  end