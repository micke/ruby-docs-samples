# Copyright 2022 Google, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require_relative "./spec_helper"
require_relative "./spanner_postgresql_helper"
require_relative "../spanner_postgresql_cast_data_type"

describe "Google Cloud Spanner Postgres examples" do
  before :each do
    cleanup_database_resources
  end

  after :each do
    cleanup_database_resources
    # cleanup_instance_resources
  end

  example "cast data type" do
    database = create_spangres_singers_albums_database
    capture do
      spanner_postgresql_cast_data_type project_id: @project_id,
                                        instance_id: @instance_id,
                                        database_id: @database_id
    end

    expect(captured_output).to include "1"
    expect(captured_output).to include "2"
    expect(captured_output).to include "3"
    expect(captured_output).to include "4"
    expect(captured_output).to include "5"
    expect(captured_output).to include "true"
    expect(captured_output).to include "2021-11-03 09:35:01 UTC"
  end
end
