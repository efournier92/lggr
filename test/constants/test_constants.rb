module TestConstants
  CONFIG_FILES = {
    TEST_PATH: './test/test_config.yml',
    BLANK_PATH: './test/blank_config.yml',
    FAKE_PATH: './test/fake_config.yml',
  }.freeze

  OUTPUT = {
    DIRECTORY: './_out_test',
    FILE_2020: 'DO_2020.md',
  }.freeze

  KEYS = {
    DIMENTIONAL_1: '1_Dimentional',
    DIMENTIONAL_2: '2_Dimentional',
    DIMENTIONAL_3: '3_Dimentional',
    DIMENTIONAL_1_DOUBLE: '1_Dimentional_Double',
    DIMENTIONAL_2_MIXED: '2_Dimentional_Mixed',
    DIMENTIONAL_3_SIBLINGS_LEAF: '3_Dimentional_Leaf_Siblings',
    DIMENTIONAL_3_SIBLINGS_INTERNAL: '3_Dimentional_Internal_Siblings',
    BIRTHDAY_PERSON: 'Birthday_Person',
  }.freeze

  HOLIDAYS = {
    FIRST_DAY: 'First_Day',
    NTH_XDAY: 'Nth_XDay',
    LAST_XDAY: 'Last_XDay',
    LAST_DAY: 'Last_Day',
    LAST_DAY_IN_JANUARY: 'Last_Day_In_January',
    LAST_THURDAY_IN_JANUARY: 'Last_Thursday_In_January',
    BIRTHDAY: 'Birthday',
  }.freeze
end
