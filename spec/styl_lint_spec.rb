# spec/game_logic_test_spec.rbc

require_relative '../lib/styl_lint'

describe Styllint do
  let(:instance_variable) { Styllint.new}
  describe '#check_space_before_open_bracket' do
    it 'would return true if there is a error' do
      error = []
      line = '.div{'
      expect(instance_variable.check_space_before_open_bracket(line, 1, error)).to eql(true)
    end

    it 'would return false if there is no error' do
      error = []
      line = '.div {'
      expect(instance_variable.check_space_before_open_bracket(line, 1, error)).to eql(false)
    end
  end

  describe '#check_newline_after_open_bracket' do
    it 'would return true if there is a error' do
      error = []
      line = '.div {'
      expect(instance_variable.check_newline_after_open_bracket(line, 1, error)).to eql(true)
    end

    it 'would return false if there is no error' do
      error = []
      line = ".div {\n"
      expect(instance_variable.check_newline_after_open_bracket(line, 1, error)).to eql(false)
    end
  end

  describe '#check_intentation_for_regular_line' do
    it 'would return true if there is a error' do
      error = []
      line = 'float:left;'
      expect(instance_variable.check_intentation_for_regular_line(line, 1, error)).to eql(true)
    end

    it 'would return true if there is a error' do
      error = []
      line = '.div{float:left;'
      expect(instance_variable.check_intentation_for_regular_line(line, 1, error)).to eql(true)
    end

    it 'would return false if there is no error' do
      error = []
      line = '  float:left;'
      expect(instance_variable.check_intentation_for_regular_line(line, 1, error)).to eql(false)
    end

    it 'would return false if there is no error' do
      error = []
      line = ".div {\n  float:left;"
      expect(instance_variable.check_intentation_for_regular_line(line, 1, error)).to eql(false)
    end
  end

  describe '#check_space_after_colon' do
    it 'would return true if there is a error' do
      error = []
      line = 'float:left; '
      expect(instance_variable.check_space_after_colon(line, 1, error)).to eql(true)
    end

    it 'would return true if there is a error' do
      error = []
      line = 'float:  left;'
      expect(instance_variable.check_space_after_colon(line, 1, error)).to eql(true)
    end

    it 'would return false if there is no error' do
      error = []
      line = 'float: left;'
      expect(instance_variable.check_space_after_colon(line, 1, error)).to eql(false)
    end
  end

  describe '#check_newline_after_semicolon' do
    it 'would return true if there is a error' do
      error = []
      line = 'float:left; '
      expect(instance_variable.check_newline_after_semicolon(line, 1, error)).to eql(true)
    end

    it 'would return true if there is a error' do
      error = []
      line = 'float:left ;'
      expect(instance_variable.check_newline_after_semicolon(line, 1, error)).to eql(true)
    end

    it 'would return true if there is a error' do
      error = []
      line = 'float:left;'
      expect(instance_variable.check_newline_after_semicolon(line, 1, error)).to eql(true)
    end

    it 'would return false if there is no error' do
      error = []
      line = "float:left;\n"
      expect(instance_variable.check_newline_after_semicolon(line, 1, error)).to eql(false)
    end
  end

  describe '#check_newline_after_closing_bracket' do
    it 'would return true if there is a error' do
      error = []
      line = '}'
      expect(instance_variable.check_newline_after_closing_bracket(line, 1, error)).to eql(true)
    end

    it 'would return false if there is a error' do
      error = []
      line = "}\n"
      expect(instance_variable.check_newline_after_closing_bracket(line, 1, error)).to eql(false)
    end
  end

  describe '#check_case_sentitive' do
    it 'would return count of capital letter' do
      error = []
      line = 'FloAt:left;'
      expect(instance_variable.check_case_sentitive(line, 1, error)).to eql(2)
    end

    it 'would return zero if there is no count of capital letter' do
      error = []
      line = 'float:left;'
      expect(instance_variable.check_case_sentitive(line, 1, error)).to eql(0)
    end
  end
end
