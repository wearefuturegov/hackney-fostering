#:nocov:
class ApplicationsPreview < ActionMailer::Preview
  def eligibility
    ApplicationsMailer.eligibility(Application.last.id)
  end
  
  def application
    ApplicationsMailer.application(Application.last.id)
  end
end
#:nocov:
