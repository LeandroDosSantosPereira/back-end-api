class ApprovedMailer < ApplicationMailer
    default from: ENV['SMTP_FROM_MAIL']

    def like_unlike(ticket, user )
        @ticket = ticket
        @user = user
    mail(
        # to: ENV['SMTP_FROM_MAIL'],
        to:  @ticket.user.email,
        from: ENV['SMTP_USER_NAME'],
        subject: 'Contato'
    ) 
    end
end
