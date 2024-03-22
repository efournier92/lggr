module TestConstants
  CONFIG_FILES = {
    TEST_PATH: './test/test_config.yml',
    FAKE_PATH: './test/fake_config.yml',
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
  }.freeze
end
