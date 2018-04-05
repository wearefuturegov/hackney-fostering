#:nocov:
class ApplicationsPreview < ActionMailer::Preview
  def eligibility
    ApplicationsMailer.eligibility(Application.last.code)
  end
  
  def application
    ApplicationsMailer.application(Application.last.code)
  end
end
#:nocov:
