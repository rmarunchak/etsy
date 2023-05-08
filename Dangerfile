
# Dangerfile
require 'octokit'

def close_pr_with_empty_description
  pr_description = github.pr_json[:body]

  if pr_description.nil? || pr_description.strip.empty?
    # Create a friendly message
    message = "This PR has an empty description. In order to maintain the quality of our repository, "\
              "we require that all PRs have a description. "\
              "Please open a new PR with a proper description to contribute to the project."

    # Add a warning to the PR
    warn(message)

    # Close the PR
    client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    repo = github.pr_json[:base][:repo][:full_name]
    pr_number = github.pr_json[:number]
    client.close_pull_request(repo, pr_number)
  end
end

close_pr_with_empty_description