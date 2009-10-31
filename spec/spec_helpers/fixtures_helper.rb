module FixturesHelper
  def random_string
    rand(100000).to_s
  end

  def create_user
    random_nickname = "valid" + random_string
    random_email = random_nickname + "@diesel.kg"

    User.create! :nickname => random_nickname, :email => random_email, :password => "1234",
      :password_confirmation => "1234"
  end

  def create_team(options={})
    random_name = "Team#" + random_string
    team = Team.new(:name => random_name, :captain => options[:captain])
    team.members << options[:members] unless options[:members].nil?
    team.save!
    team
  end

  def create_invitation(options={})
    for_user = options[:for] || create_user
    from_team = options[:from] || create_team(:captain => create_user)
    Invitation.create! :to_team => from_team, :recepient_nickname => for_user.nickname
  end

  def build_game(options={})
    creation_params = {
      :author => create_user,
      :name => random_string,
      :description => random_string,
      :starts_at => "2099-01-01 00:00"
    }.merge(options)
    Game.new creation_params
  end

  def create_game(options={})
    game = build_game(options)
    game.save!
    game
  end

  def create_level(options={})
    creation_params = {
      :name => 'Test level',
      :text => "Some text",
      :correct_answers => "correct answers",
      :game => create_game
    }.merge(options)
    Level.create! creation_params
  end

  def create_game_passing(options={})
    game = options.delete(:game) || create_game
    level = options.delete(:level) || create_level(:game => game)
    
    creation_params = {
      :game => game,
      :current_level => level,
      :team => create_team
    }.merge(options)
    
    GamePassing.create! creation_params
  end

  def create_hint(options={})
    creation_params = {
      :level => create_level,
      :text => 'Test hint',
      :delay => rand(60) * 60
    }.merge(options)

    Hint.create! creation_params
  end
end