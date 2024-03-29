module ConfigConstants
  KEYS = {
    TASKS: 'tasks_config',
    DAYS: 'days_config',
    SPECIAL: 'special_config',
    TEMPLATES: 'templates_config',
    TEMPLATE: 'template',
    TEMPLATE_VARIABLES: 'template_variables',
    SPECIFIC_DATE: 'specific_date',
    METHOD: 'method',
    CONTENT: 'content',
    TAG: 'tag',
    MONTH: 'month',
    DAY: 'day',
    NTH_DAY: 'nth_day',
    DAY_NAME: 'day_name',
    N_WEEKS: 'n_weeks',
    IS_EACH?: 'is_each',
  }.freeze

  PLACEHOLDERS = {
    TEMPLATE_START: '{{',
    TEMPLATE_END: '}}',
    CONTENT: '{{CONTENT}}'
  }.freeze

  SPECIAL_METHODS = {
    SPECIFIC_DATE: 'to_specific_date',
  }.freeze

  TEMPLATE_TYPES = {
    HOLIDAY: 'Holiday',
  }.freeze

  MODES = {
    DO: 'DO',
    LG: 'LG'
  }.freeze
end
