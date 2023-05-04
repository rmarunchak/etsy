
# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 5000

warn("PR is classed as Work in Progress") if github.pr_title.include? "WIP"

if github.pr_body.length < 5
  fail "Please provide a summary in the PR description"
end

rubocop.lint(inline_mode: true)