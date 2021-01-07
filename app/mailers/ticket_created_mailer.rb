class TicketCreatedMailer < ApplicationMailer
    default from: ENV['SMTP_FROM_MAIL']

    def open_call(ticket, email_to )
        @ticket = ticket
        @email_to = email_to
    mail(
        # to: ENV['SMTP_FROM_MAIL'],
        to:  @email_to,
        from: ENV['SMTP_USER_NAME'],
        subject: 'Contato'
    ) 
    end
end
