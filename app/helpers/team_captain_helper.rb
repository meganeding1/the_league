module TeamCaptainHelper
  def team_captain?(user, team)
    if user == team.team_captain
      true
    else
      false
    end
  end
end
