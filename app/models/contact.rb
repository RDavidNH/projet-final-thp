class Contact
    attr_accessor :email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    include ActiveModel::Model

    def email_validation(email)
        if email != ""
            if !(email =~ VALID_EMAIL_REGEX).nil?   
                return true
            else
                return false
            end
        else
            return false
        end
    end
end
