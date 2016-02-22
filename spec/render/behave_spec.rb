require_relative '../spec_helper'
require_relative '../render_shared'

describe 'Specflow rendering' do
  it_behaves_like 'a BDD renderer' do
    let(:language) {'behave'}

    let(:rendered_actionwords) {
      [
        'from behave import *',
        '',
        '# This should be added to environments.py',
        '# from steps.actionwords import Actionwords',
        '#',
        '# def before_scenario(context, scenario):',
        '#     context.actionwords = Actionwords.new(nil)',
        '',
        'use_step_matcher(\'re\')',
        '',
        '',
        '@given(r\'the color "(.*)"\')',
        'def impl(context, color):',
        '    context.actionwords.the_color_color(color)',
        '',
        '',
        '@when(r\'you mix colors\')',
        'def impl(context):',
        '    context.actionwords.you_mix_colors()',
        '',
        '',
        '@then(r\'you obtain "(.*)"\')',
        'def impl(context, color):',
        '    context.actionwords.you_obtain_color(color)',
        '',
        '',
        ''
      ].join("\n")
    }
  end
end
