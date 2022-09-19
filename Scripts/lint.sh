#bin/sh
# M1 Macの場合はHomebrewのパスを追加する
if [ $(uname -m) = "arm64" ]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:${PATH+:$PATH}";
fi

if mint list | grep -q 'SwiftLint'; then
  mint run swiftlint lint --autocorrect --format
else
  echo "warning: SwiftLint not installed."
fi