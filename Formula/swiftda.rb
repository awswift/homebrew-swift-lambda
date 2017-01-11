class Swiftda < Formula
  desc "Brings the Swift language to AWS Lambda"
  homepage "https://swiftda.readthedocs.io/en/latest/"
  head "https://github.com/awswift/swiftda.git"

  depends_on "awscli"

  def install
    ENV.delete "CC" # https://bugs.swift.org/browse/SR-3151
    system "swift", "package", "fetch"
    system "swift", "build"
    mv ".build/debug/Swiftda", "swiftda"
    bin.install "swiftda"
  end

  test do
    system "#{bin}/swiftda"
  end
end
