class ApplicationMailer < ActionMailer::Base
  default to: "admin@gyumri-college.am",
  from: "no-reply@gyumri-college.am"

  def new_application(application)
    @application = application
    mail(subject: "Նոր դիմում է ստացվել")
  end
end
