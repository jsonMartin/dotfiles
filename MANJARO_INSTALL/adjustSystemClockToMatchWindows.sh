# Adjusts Linux to use local time (instead of UTC time) to match Windows
# Otherwise, Windows will show incorrect time
# https://www.howtogeek.com/323390/how-to-fix-windows-and-linux-showing-different-times-when-dual-booting/

timedatectl set-local-rtc 1 --adjust-system-clock
