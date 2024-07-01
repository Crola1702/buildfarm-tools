#!/usr/bin/env ruby

require_relative 'lib/report_formatter'
require 'json'

report_name = ARGV.shift

report = JSON.load_file(report_name)

report['urgent']['build_regressions'] = ReportFormatter::build_regressions(report['urgent']['build_regressions'])

# These are not implemented yet!!!
report['urgent']['test_regressions_consecutive'] = []
report['urgent']['test_regressions_flaky'] = []

# Sample output:
# puts report['urgent']['build_regressions']
puts ReportFormatter::format_report report