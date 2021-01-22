class CommentCreatedMailer < ApplicationMailer
    default from: ENV['SMTP_FROM_MAIL']

    def comment_send(comment, user_env, user_from)
        @comment = comment
        @user_env = user_env
        @user_from = user_from
    mail(
        # to: ENV['SMTP_FROM_MAIL'],
        to:  @user_env.email,
        from: ENV['SMTP_USER_NAME'],
        subject: 'Contato'
    ) 
    end
end
