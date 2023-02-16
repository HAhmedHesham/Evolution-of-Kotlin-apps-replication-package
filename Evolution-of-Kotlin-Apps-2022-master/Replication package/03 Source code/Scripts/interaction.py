# noinspection PyUnusedLocal
import subprocess
def main(device, *args, **kwargs):
    print('=INTERACTION=')
    print((device.id))
    print((device.current_activity()))
    subprocess.run(["monkeyrunner", "/usr/lib/android-sdk/tools/swt/monkeyrunner/scripts/monkey_playback.py", "Anki2.16.mr"])
