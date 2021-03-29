ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Users' do
          ul do
            User.all.map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel 'Books' do
          ul do
            Book.all.map do |book|
              li link_to(book.title, admin_book_path(book))
            end
          end
        end
      end

      column do
        panel 'Rents' do
          ul do
            Rent.all.map do |rent|
              li link_to(rent.created_at, admin_rent_path(rent))
            end
          end
        end
      end
    end
  end
end
