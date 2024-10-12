class Minijinja < Formula
  desc "Render Jinja2 templates directly from the command line to stdout"
  homepage "https://github.com/mitsuhiko/minijinja"
  url "https://github.com/mitsuhiko/minijinja/archive/refs/tags/2.3.1.tar.gz"
  sha256 "c933a1d9f53de26bb776a61b9346e0b202c332b4ff1309db5d0178a9b603ca06"
  license "Apache-2.0"
  head "https://github.com/mitsuhiko/minijinja.git", branch: "main"

  depends_on "rust" => :build

  def install
      cd "minijinja-cli" do
        system "cargo", "install", *std_cargo_args
      end
      bin.install "target/release/minijinja-cli" => "minijinja"
    end

  test do
    assert_match "minijinja-cli #{version}", shell_output("#{bin}/minijinja --version")
  end
end
