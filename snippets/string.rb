class String
  def underscored
    self.gsub(/(\W+)/, "_").gsub(/^\_/, "").gsub(/_$/, "")
  end
end
