#!/data/data/com.termux/files/usr/bin/bash
set -e
pkg update -y -q && pkg install -y openjdk-17 wget unzip -q
[ -f Godot_v4.3-stable_linux.x86_64 ] || {
  wget -q https://downloads.tuxfamily.org/godotengine/4.3/Godot_v4.3-stable_linux.x86_64.zip
  unzip -q Godot_v4.3-stable_linux.x86_64.zip
  chmod +x Godot_v4.3-stable_linux.x86_64
}
export JAVA_HOME=/data/data/com.termux/files/usr/lib/jvm/java-17-openjdk-amd64
./Godot_v4.3-stable_linux.x86_64 --headless --export-release "Android" MondeOuvert.apk
echo "✅ APK généré: $(pwd)/MondeOuvert.apk"
