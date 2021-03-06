# Redmine - project management software
# Copyright (C) 2006-2013  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require File.expand_path('../../../test_helper', __FILE__)

class QueriesHelperTest < ActionView::TestCase
  include QueriesHelper
  include Redmine::I18n

  fixtures :projects, :enabled_modules, :users, :members,
           :member_roles, :roles, :trackers, :issue_statuses,
           :issue_categories, :enumerations, :issues,
           :watchers, :custom_fields, :custom_values, :versions,
           :queries,
           :projects_trackers,
           :custom_fields_trackers

# TODO: fix this later
=begin
  def test_filters_options_should_be_ordered
    set_language_if_valid 'en'
    query = IssueQuery.new
    filter_count = query.available_filters.size
    fo = filters_options(query)
    assert_equal filter_count + 1, fo.size
    assert_equal [], fo[0]

    expected_order = [
      "Status",
      "Project",
      "Tracker",
      "Priority"
    ]
    assert_equal expected_order, (fo.map(&:first) & expected_order)
  end

  def test_filters_options_should_be_ordered_with_custom_fields
    set_language_if_valid 'en'
    field = UserCustomField.create!(
              :name => 'order test', :field_format => 'string',
              :is_for_all => true, :is_filter => true
            )
    query = IssueQuery.new
    filter_count = query.available_filters.size
    fo = filters_options(query)
    assert_equal filter_count + 1, fo.size

    expected_order = [
      "Searchable field",
      "Database",
      "Project's Development status",
      "Author's order test",
      "Assignee's order test"
    ]
    assert_equal expected_order, (fo.map(&:first) & expected_order)
  end
=end
end
