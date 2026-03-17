class BookSuggestionPolicy < ApplicationPolicy
  def destroy?
    user.present? && user == book_suggestion.user
  end

  private

  def book_suggestion
    record
  end
end
