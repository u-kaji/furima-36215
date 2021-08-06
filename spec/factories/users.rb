FactoryBot.define do
  factory :user do
    nickname {'tanaka'}
    email {'test@test'}
    password {'123456'}
    password_confirmation {password}
    name_last {'太郎'}
    name_first {'田中'}
    name_last_kana {'タロウ'}
    name_first_kana {'タナカ'}
    birthday {'1999-09-09'}
  end
end
