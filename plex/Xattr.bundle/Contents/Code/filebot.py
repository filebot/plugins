import subprocess


class FileBotCommand:
  executable = '/usr/local/bin/filebot'

  def metadata(self, file):
    args = ['-mediainfo', file, '--format', '{json}', '--log', 'OFF']
    return self.execute(args)

  def version(self):
    args = ['-version']
    return self.execute(args)

  def execute(self, args):
    command = [self.executable]
    command.extend(args)
    return subprocess.check_output(command)


if __name__ == "__main__":
  filebot = FileBotCommand()
  print(filebot.version())
