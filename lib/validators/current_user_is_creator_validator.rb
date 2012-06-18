class CurrentUserIsCreatorValidator < ActiveModel::Validator
  # implement the method where the validation logic must reside
  def validate(record)
    unless record.creator_id == current_user.id && record.creator_type == "user"
      record.errors[:base] << I18n.t('errors.messages.you_are_not_its_creator')
    end
  end
end