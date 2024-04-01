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

  LISTS = {
    QUARTER_MONTHS: [1, 4, 7, 10],
    NON_QUARTER_MONTHS: [2, 3, 5, 6, 8, 9, 11, 12]
  }.freeze
end
