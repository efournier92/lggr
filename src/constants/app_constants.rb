module AppConstants
  MODES = {
    DO: 'DO',
    LG: 'LG',
    ALL: 'ALL'
  }.freeze

  INPUT_PROMPTS = {
    MODE: "DO || LG\n>> ",
    YEAR: "Which Year?\n>> ",
    MONTH: "MONTH: [1-12] || ALL\n>> "
  }.freeze

  REGEX = {
    VALID_MONTH: /^([1-9]|1[0-2])$/
  }.freeze
end
