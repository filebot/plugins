import subprocess


class FileBotCommand:
  executabe = '/usr/local/bin/filebot'

  def version(self):
    args = ['-version']
    return self.execute(args).strip()

  def execute(self, args):
    command = [self.executabe]
    command.extend(args)
    return subprocess.check_output(command)


if __name__ == "__main__":
  filebot = FileBotCommand()
  print(filebot.version())
