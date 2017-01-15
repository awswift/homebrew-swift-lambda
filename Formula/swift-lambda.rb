class Swiftda < Formula
  desc "Brings the Swift language to AWS Lambda"
  homepage "https://swiftda.readthedocs.io/en/latest/"
  head "https://github.com/awswift/swift-lambda.git"

  depends_on "awscli"

  def install
    ENV.delete "CC" # https://bugs.swift.org/browse/SR-3151
    system "swift", "package", "fetch"
    system "swift", "build"
    mv ".build/debug/SwiftLambda", "swift-lambda"
    bin.install "swift-lambda"
  end

  test do
    system "#{bin}/swift-lambda"
  end
end
