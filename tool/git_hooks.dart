import 'package:dart_pre_commit/dart_pre_commit.dart';
import 'package:git_hooks/git_hooks.dart';

void main(List<String> arguments) {
  Map<Git, UserBackFun> params = {
    Git.commitMsg: _checkCommitMessage,
    Git.preCommit: _preCommit,
  };
  GitHooks.call(arguments, params);
}

Future<bool> _preCommit() async {
  // Run dart_pre_commit package function to auto run various flutter commands
  final result = await DartPreCommit.run();
  return result.isSuccess;
}

Future<bool> _checkCommitMessage() async {
  print("🔍 Checking commit message format...");

  final commitMsg = Utils.getCommitEditMsg();

  // Regex patterns
  final conventionalPattern = RegExp(
    r'^(feat|fix|docs|style|refactor|test|chore)(\([a-z-]+\))?!?: .+',
  );
  final mergePattern = RegExp(
    r'^Merge (branch|pull request|remote-tracking branch) ".*"( into .*)?$',
  );
  final revertPattern = RegExp(r'^Revert ".*"$');

  // Check if it matches any of the allowed patterns
  if (mergePattern.hasMatch(commitMsg)) {
    print("✅ Valid merge commit message!");
    return true;
  }

  if (revertPattern.hasMatch(commitMsg)) {
    print("✅ Valid revert commit message!");
    return true;
  }

  if (conventionalPattern.hasMatch(commitMsg)) {
    print("✅ Valid conventional commit message!");
    return true;
  }

  // If we get here, the message format is invalid
  print("❌ Invalid commit message format.");
  print("Please use one of these formats:");
  print("");
  print("1. Conventional commits:");
  print("  feat(scope): description");
  print("  fix(scope): description");
  print("  docs(scope): description");
  print("  style(scope): description");
  print("  refactor(scope): description");
  print("  test(scope): description");
  print("  chore(scope): description");
  print("");
  print("2. Merge commits (automatic):");
  print("  Merge branch 'branch-name'");
  print("  Merge pull request #123 from owner/branch");
  print("");
  print("3. Revert commits (automatic):");
  print("  Revert \"original commit message\"");

  return false;
}
